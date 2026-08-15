-- ============================================================
-- PLATAFORMA DE TORNEOS — 15. Puntos de ranking automáticos
-- ============================================================
-- Hasta ahora "ranking_rules" y "ranking_events" eran solo esqueleto
-- de base de datos, sin nada que los usara. Esta migracion conecta
-- una sola pieza automática (la mas natural): cuando un partido de
-- torneo termina, si existe una regla activa de tipo 'match_win' para
-- la temporada/categoria/torneo correspondiente, se les cargan los
-- puntos SOLOS a los dos jugadores de la pareja ganadora.
--
-- Como se elige la regla si hay varias que podrian aplicar: se
-- prioriza la mas especifica (una regla atada a ESE torneo puntual,
-- despues una atada a esa categoria, y por ultimo la mas general —
-- solo por temporada).
--
-- Por que es seguro llamarlo mas de una vez: finalize_match() ya era
-- idempotente (si el partido ya estaba finalizado, no hace nada mas).
-- Ademas, "source_key" en ranking_events es UNIQUE, asi que aunque
-- por algun motivo se intentara cargar el mismo punto dos veces, la
-- segunda vez no hace nada (on conflict do nothing) en vez de romper
-- o duplicar puntos.
--
-- Lo que NO hace esta migracion (queda para si hace falta despues):
-- puntos por salir campeon/subcampeon de un torneo (eso requiere
-- saber cual fue la final de cada categoria, que hoy no esta resuelto
-- de forma generica). Para esos casos, el admin puede cargar los
-- puntos a mano desde el panel nuevo (pestaña "Ranking" en
-- catalogo.html).
-- ============================================================

create or replace function finalize_match(p_match_id text)
returns matches
language plpgsql
security definer
set search_path = public
as $$
declare
  v_match matches;
  v_winner_pair uuid;
  v_loser_pair uuid;
  v_slot record;
  v_season_id uuid;
  v_rule ranking_rules;
  v_winner_pair_row tournament_pairs;
begin
  select * into v_match from matches where id = p_match_id for update;

  if v_match is null then
    raise exception 'Partido no encontrado';
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

  update matches
    set is_finished = true,
        is_live = false,
        winner_pair_id = v_winner_pair,
        actual_finished_at = now(),
        match_status = case when v_match.score_a > v_match.score_b then 'A' else 'B' end
    where id = p_match_id
    returning * into v_match;

  if v_winner_pair is not null then
    for v_slot in select * from match_slots where source_match_id = p_match_id loop
      if v_slot.source_type = 'winner_of' then
        update match_slots set resolved_pair_id = v_winner_pair where id = v_slot.id;
      elsif v_slot.source_type = 'loser_of' then
        update match_slots set resolved_pair_id = v_loser_pair where id = v_slot.id;
      end if;
      update matches
        set pair_a_id = case when v_slot.side = 'A' then
              (select resolved_pair_id from match_slots where id = v_slot.id) else pair_a_id end,
            pair_b_id = case when v_slot.side = 'B' then
              (select resolved_pair_id from match_slots where id = v_slot.id) else pair_b_id end,
            team_a_name = case when v_slot.side = 'A' then
              (select display_name from tournament_pairs where id =
                (select resolved_pair_id from match_slots where id = v_slot.id)) else team_a_name end,
            team_b_name = case when v_slot.side = 'B' then
              (select display_name from tournament_pairs where id =
                (select resolved_pair_id from match_slots where id = v_slot.id)) else team_b_name end
        where id = v_slot.match_id;
    end loop;

    -- ------------------------------------------------------------
    -- Puntos de ranking automaticos por ganar el partido.
    -- ------------------------------------------------------------
    if v_match.tournament_id is not null and v_match.category_id is not null then
      select season_id into v_season_id from tournaments where id = v_match.tournament_id;

      if v_season_id is not null then
        select * into v_rule
          from ranking_rules
          where event_type = 'match_win'
            and active
            and season_id = v_season_id
            and (tournament_id is null or tournament_id = v_match.tournament_id)
            and (category_id is null or category_id = v_match.category_id)
          order by (tournament_id is not null) desc, (category_id is not null) desc
          limit 1;

        if v_rule.id is not null then
          select * into v_winner_pair_row from tournament_pairs where id = v_winner_pair;

          if v_winner_pair_row.player_1_id is not null then
            insert into ranking_events
              (player_id, season_id, category_id, tournament_id, match_id, event_type, points, description, source_key)
            values
              (v_winner_pair_row.player_1_id, v_season_id, v_match.category_id, v_match.tournament_id, p_match_id,
               'match_win', v_rule.points, 'Ganó partido ' || coalesce(v_match.match_number::text, p_match_id),
               'match_win:' || p_match_id || ':' || v_winner_pair_row.player_1_id)
            on conflict (source_key) do nothing;
          end if;

          if v_winner_pair_row.player_2_id is not null then
            insert into ranking_events
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

  insert into audit_logs (user_id, action, entity_type, entity_id, metadata)
  values (auth.uid(), 'match_finished', 'match', p_match_id,
          jsonb_build_object('score_a', v_match.score_a, 'score_b', v_match.score_b,
                              'winner_pair_id', v_winner_pair));

  return v_match;
end;
$$;
