-- ============================================================
-- PLATAFORMA DE TORNEOS — 18. Endurecimiento integral de seguridad
-- Ejecutar despues de 017-sets.sql.
-- ============================================================

begin;

-- Los perfiles solo se crean mediante handle_new_user(), que fuerza
-- referee + inactive. Se elimina el camino alternativo de autoalta.
alter table public.profiles alter column active set default false;
drop policy if exists "profiles: usuario nuevo crea su propio perfil" on public.profiles;

-- Los datos internos de jugadores y ranking quedan solo para admin.
-- Los nombres deportivos publicos siguen disponibles a traves de
-- tournament_pairs.display_name.
drop policy if exists "players: lectura publica" on public.players;
drop policy if exists "ranking_rules: lectura publica" on public.ranking_rules;
drop policy if exists "ranking_events: lectura publica" on public.ranking_events;

-- Un arbitro puede crear un partido suelto para operar el tanteador,
-- pero solo un admin puede crear partidos asociados a un torneo.
drop policy if exists "matches: usuario activo crea partido" on public.matches;
drop policy if exists "matches: admin crea; arbitro solo partido suelto" on public.matches;
create policy "matches: admin crea; arbitro solo partido suelto"
  on public.matches for insert
  with check (
    public.is_admin()
    or (
      public.auth_is_active()
      and referee_user_id = auth.uid()
      and tournament_id is null
      and tournament_day_id is null
      and category_id is null
      and court_id is null
      and group_id is null
      and pair_a_id is null
      and pair_b_id is null
      and winner_pair_id is null
      and score_a = 0
      and score_b = 0
      and is_finished = false
    )
  );

-- Reemplaza la version anterior incorporando autorizacion dentro de la
-- propia funcion security definer.
create or replace function public.finalize_match(p_match_id text)
returns public.matches
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_match public.matches%rowtype;
  v_winner_pair uuid;
  v_loser_pair uuid;
  v_slot record;
  v_season_id uuid;
  v_rule public.ranking_rules%rowtype;
  v_winner_pair_row public.tournament_pairs%rowtype;
begin
  select * into v_match from public.matches where id = p_match_id for update;

  if v_match is null then
    raise exception 'Partido no encontrado';
  end if;

  -- La funcion eleva privilegios para resolver cruces y ranking, por eso
  -- valida al invocante antes de realizar cualquier modificacion.
  if auth.uid() is null or not (
    public.is_admin()
    or (
      v_match.referee_user_id = auth.uid()
      and public.auth_is_active()
    )
  ) then
    raise exception 'No autorizado para finalizar este partido'
      using errcode = '42501';
  end if;

  if v_match.is_finished then
    return v_match;  -- idempotente: doble click / reintento no rompe nada
  end if;

  if v_match.score_a = v_match.score_b then
    raise exception 'No se puede finalizar un partido empatado';
  end if;

  if v_match.pair_a_id is not null and v_match.pair_b_id is not null then
    if v_match.score_a > v_match.score_b then
      v_winner_pair := v_match.pair_a_id; v_loser_pair := v_match.pair_b_id;
    else
      v_winner_pair := v_match.pair_b_id; v_loser_pair := v_match.pair_a_id;
    end if;
  end if;

  update public.matches
    set is_finished = true,
        is_live = false,
        winner_pair_id = v_winner_pair,
        actual_finished_at = now(),
        match_status = case when v_match.score_a > v_match.score_b then 'A' else 'B' end
    where id = p_match_id
    returning * into v_match;

  if v_winner_pair is not null then
    for v_slot in select * from public.match_slots where source_match_id = p_match_id loop
      if v_slot.source_type = 'winner_of' then
        update public.match_slots set resolved_pair_id = v_winner_pair where id = v_slot.id;
      elsif v_slot.source_type = 'loser_of' then
        update public.match_slots set resolved_pair_id = v_loser_pair where id = v_slot.id;
      end if;
      update public.matches
        set pair_a_id = case when v_slot.side = 'A' then
              (select resolved_pair_id from public.match_slots where id = v_slot.id) else pair_a_id end,
            pair_b_id = case when v_slot.side = 'B' then
              (select resolved_pair_id from public.match_slots where id = v_slot.id) else pair_b_id end,
            team_a_name = case when v_slot.side = 'A' then
              (select display_name from public.tournament_pairs where id =
                (select resolved_pair_id from public.match_slots where id = v_slot.id)) else team_a_name end,
            team_b_name = case when v_slot.side = 'B' then
              (select display_name from public.tournament_pairs where id =
                (select resolved_pair_id from public.match_slots where id = v_slot.id)) else team_b_name end
        where id = v_slot.match_id;
    end loop;

    -- ------------------------------------------------------------
    -- Puntos de ranking automaticos por ganar el partido.
    -- ------------------------------------------------------------
    if v_match.tournament_id is not null and v_match.category_id is not null then
      select season_id into v_season_id from public.tournaments where id = v_match.tournament_id;

      if v_season_id is not null then
        select * into v_rule
          from public.ranking_rules
          where event_type = 'match_win'
            and active
            and season_id = v_season_id
            and (tournament_id is null or tournament_id = v_match.tournament_id)
            and (category_id is null or category_id = v_match.category_id)
          order by (tournament_id is not null) desc, (category_id is not null) desc
          limit 1;

        if v_rule.id is not null then
          select * into v_winner_pair_row from public.tournament_pairs where id = v_winner_pair;

          if v_winner_pair_row.player_1_id is not null then
            insert into public.ranking_events
              (player_id, season_id, category_id, tournament_id, match_id, event_type, points, description, source_key)
            values
              (v_winner_pair_row.player_1_id, v_season_id, v_match.category_id, v_match.tournament_id, p_match_id,
               'match_win', v_rule.points, 'Ganó partido ' || coalesce(v_match.match_number::text, p_match_id),
               'match_win:' || p_match_id || ':' || v_winner_pair_row.player_1_id)
            on conflict (source_key) do nothing;
          end if;

          if v_winner_pair_row.player_2_id is not null then
            insert into public.ranking_events
              (player_id, season_id, category_id, tournament_id, match_id, event_type, points, description, source_key)
            values
              (v_winner_pair_row.player_2_id, v_season_id, v_match.category_id, v_match.tournament_id, p_match_id,
               'match_win', v_rule.points, 'Ganó partido ' || coalesce(v_match.match_number::text, p_match_id),
               'match_win:' || p_match_id || ':' || v_winner_pair_row.player_2_id)
            on conflict (source_key) do nothing;
          end if;
        end if;
      end if;
    end if;
  end if;

  insert into public.audit_logs (user_id, action, entity_type, entity_id, metadata)
  values (auth.uid(), 'match_finished', 'match', p_match_id,
          jsonb_build_object('score_a', v_match.score_a, 'score_b', v_match.score_b,
                              'winner_pair_id', v_winner_pair));

  return v_match;
end;
$$;


revoke execute on function public.finalize_match(text) from public;
revoke execute on function public.finalize_match(text) from anon;
grant execute on function public.finalize_match(text) to authenticated;

-- La correccion de resultados ya valida is_admin() internamente, pero
-- tampoco debe estar expuesta al rol anonimo.
revoke execute on function public.correct_match_result(text, int, int) from public;
revoke execute on function public.correct_match_result(text, int, int) from anon;
grant execute on function public.correct_match_result(text, int, int) to authenticated;

-- Registro publico de push mediante una interfaz validada e idempotente.
create or replace function public.register_push_subscription(
  p_pair_id uuid,
  p_endpoint text,
  p_p256dh text,
  p_auth text
)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_status text;
  v_existing boolean;
  v_endpoint_count integer;
begin
  if p_pair_id is null
     or p_endpoint is null
     or p_p256dh is null
     or p_auth is null then
    raise exception 'Datos de suscripcion incompletos'
      using errcode = '22023';
  end if;

  if length(p_endpoint) > 2048
     or length(p_p256dh) not between 40 and 256
     or length(p_auth) not between 8 and 128 then
    raise exception 'Datos de suscripcion invalidos'
      using errcode = '22023';
  end if;

  if lower(p_endpoint) !~ '^https://(fcm\.googleapis\.com|([a-z0-9-]+\.)*push\.services\.mozilla\.com|([a-z0-9-]+\.)*notify\.windows\.com|web\.push\.apple\.com)/' then
    raise exception 'Proveedor push no permitido'
      using errcode = '22023';
  end if;

  if p_p256dh !~ '^[A-Za-z0-9_-]+$' or p_auth !~ '^[A-Za-z0-9_-]+$' then
    raise exception 'Claves push invalidas'
      using errcode = '22023';
  end if;

  select t.status
    into v_status
    from public.tournament_pairs tp
    join public.tournaments t on t.id = tp.tournament_id
   where tp.id = p_pair_id;

  if v_status is null or v_status not in ('published', 'in_progress') then
    raise exception 'La pareja no pertenece a un torneo publico'
      using errcode = '42501';
  end if;

  select exists(
    select 1 from public.push_subscriptions
     where pair_id = p_pair_id and endpoint = p_endpoint
  ) into v_existing;

  if v_existing then
    return;
  end if;

  select count(*)
    into v_endpoint_count
    from public.push_subscriptions
   where endpoint = p_endpoint;

  if v_endpoint_count >= 20 then
    raise exception 'Limite de suscripciones alcanzado'
      using errcode = '54000';
  end if;

  insert into public.push_subscriptions(pair_id, endpoint, p256dh, auth)
  values (p_pair_id, p_endpoint, p_p256dh, p_auth)
  on conflict (pair_id, endpoint) do nothing;
end;
$$;

revoke insert, update, delete on table public.push_subscriptions from anon, authenticated;
revoke execute on function public.register_push_subscription(uuid, text, text, text) from public;
grant execute on function public.register_push_subscription(uuid, text, text, text) to anon, authenticated;

commit;
