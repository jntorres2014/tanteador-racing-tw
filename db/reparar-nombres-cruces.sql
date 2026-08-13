-- ============================================================
-- REPARACION PUNTUAL: nombres viejos en cruces ya resueltos
-- ============================================================
-- Correr UNA sola vez, despues de haber actualizado
-- 005-finalize-match.sql. Corrige los partidos que ya habian
-- resuelto su cruce (Ganador/Perdedor Partido N) ANTES del arreglo,
-- y que por eso todavia muestran el texto viejo ("Ganador Partido
-- N") en vez del nombre real de la pareja.
--
-- Es seguro correrlo mas de una vez: si no hay nada para reparar,
-- no cambia nada.
-- ============================================================

update matches m
set team_a_name = tp.display_name
from match_slots s
join tournament_pairs tp on tp.id = s.resolved_pair_id
where s.match_id = m.id
  and s.side = 'A'
  and s.resolved_pair_id is not null
  and m.team_a_name is distinct from tp.display_name;

update matches m
set team_b_name = tp.display_name
from match_slots s
join tournament_pairs tp on tp.id = s.resolved_pair_id
where s.match_id = m.id
  and s.side = 'B'
  and s.resolved_pair_id is not null
  and m.team_b_name is distinct from tp.display_name;

-- Verificacion: deberia devolver 0 filas si ya quedo todo prolijo.
select m.id, m.label, m.team_a_name, m.team_b_name
from matches m
join match_slots s on s.match_id = m.id
join tournament_pairs tp on tp.id = s.resolved_pair_id
where (s.side = 'A' and m.team_a_name is distinct from tp.display_name)
   or (s.side = 'B' and m.team_b_name is distinct from tp.display_name);
