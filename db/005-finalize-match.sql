-- ============================================================
-- PLATAFORMA DE TORNEOS — 5. finalize_match() / correct_match_result()
-- ============================================================
-- Funcion unica de finalizacion, sirve tanto para un partido de
-- tanteador simple (sin torneo asociado) como para uno de torneo:
-- si el partido no tiene pair_a_id/pair_b_id (partido suelto), solo
-- guarda el resultado como hace el boton "Finalizar" de hoy. Si SI
-- tiene parejas de torneo, ademas resuelve los cruces dependientes.
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
      -- ademas de guardar el id de la pareja resuelta, actualiza el
      -- nombre que se ve en pantalla (team_a_name/team_b_name), que
      -- hasta ahora decia el texto original del fixture ("Ganador
      -- Partido N"). Sin esto, control.html seguia mostrando el
      -- texto viejo aunque el cruce ya estuviera resuelto.
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
  end if;

  insert into audit_logs (user_id, action, entity_type, entity_id, metadata)
  values (auth.uid(), 'match_finished', 'match', p_match_id,
          jsonb_build_object('score_a', v_match.score_a, 'score_b', v_match.score_b,
                              'winner_pair_id', v_winner_pair));

  return v_match;
end;
$$;

create or replace function correct_match_result(p_match_id text, p_score_a int, p_score_b int)
returns matches
language plpgsql
security definer
set search_path = public
as $$
declare
  v_before matches;
  v_after matches;
  v_downstream_count int;
begin
  if not is_admin() then
    raise exception 'Solo un administrador puede corregir un resultado';
  end if;

  select * into v_before from matches where id = p_match_id for update;
  if v_before is null then
    raise exception 'Partido no encontrado';
  end if;

  select count(*) into v_downstream_count
  from match_slots where source_match_id = p_match_id and resolved_pair_id is not null;

  update matches
    set score_a = p_score_a, score_b = p_score_b,
        winner_pair_id = case when v_before.pair_a_id is null then null
                              when p_score_a > p_score_b then pair_a_id
                              when p_score_b > p_score_a then pair_b_id
                              else null end
    where id = p_match_id
    returning * into v_after;

  insert into audit_logs (user_id, action, entity_type, entity_id, metadata)
  values (auth.uid(), 'match_result_corrected', 'match', p_match_id,
    jsonb_build_object(
      'before', jsonb_build_object('score_a', v_before.score_a, 'score_b', v_before.score_b),
      'after', jsonb_build_object('score_a', p_score_a, 'score_b', p_score_b),
      'downstream_slots_already_resolved', v_downstream_count));

  if v_downstream_count > 0 then
    raise notice 'Atencion: % cruce(s) dependiente(s) ya fueron resueltos y no se actualizaron automaticamente.', v_downstream_count;
  end if;

  return v_after;
end;
$$;
