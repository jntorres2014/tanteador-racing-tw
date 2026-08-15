-- ============================================================
-- PLATAFORMA DE TORNEOS — 16. Última pieza para borrar un torneo entero
-- ============================================================
-- Con las migraciones 013 y 014, borrar un torneo ya arrastraba sus
-- partidos y sus cruces. Pero quedaban sueltas las referencias que
-- apuntan a "tournament_pairs" (las parejas) desde otros lugares:
--
--   - matches.pair_a_id / pair_b_id / winner_pair_id
--   - match_slots.pair_id / resolved_pair_id
--
-- A diferencia de las migraciones anteriores, ACA no conviene poner
-- "on delete cascade": si por algun motivo un partido de OTRO torneo
-- llegara a referenciar una pareja de este (algo que no deberia pasar
-- en el uso normal, pero mejor curarse en salud), un cascade borraria
-- de rebote un partido que no tiene nada que ver. En su lugar, se usa
-- "on delete set null": la referencia simplemente queda vacia, sin
-- borrar nada mas alla de la pareja misma.
--
-- Con esto, borrar un torneo completo vuelve a ser:
--
--   delete from tournaments where id = '...';
-- ============================================================

alter table matches drop constraint if exists matches_pair_a_id_fkey;
alter table matches
  add constraint matches_pair_a_id_fkey
  foreign key (pair_a_id) references tournament_pairs(id) on delete set null;

alter table matches drop constraint if exists matches_pair_b_id_fkey;
alter table matches
  add constraint matches_pair_b_id_fkey
  foreign key (pair_b_id) references tournament_pairs(id) on delete set null;

alter table matches drop constraint if exists matches_winner_pair_id_fkey;
alter table matches
  add constraint matches_winner_pair_id_fkey
  foreign key (winner_pair_id) references tournament_pairs(id) on delete set null;

alter table match_slots drop constraint if exists match_slots_pair_id_fkey;
alter table match_slots
  add constraint match_slots_pair_id_fkey
  foreign key (pair_id) references tournament_pairs(id) on delete set null;

alter table match_slots drop constraint if exists match_slots_resolved_pair_id_fkey;
alter table match_slots
  add constraint match_slots_resolved_pair_id_fkey
  foreign key (resolved_pair_id) references tournament_pairs(id) on delete set null;

-- ranking_events SI conviene en cascada: si se borra el torneo (o el
-- partido puntual) que origino esos puntos, los puntos asociados ya
-- no tienen sentido — quedarian huerfanos sin poder verificarse.
alter table ranking_events drop constraint if exists ranking_events_tournament_id_fkey;
alter table ranking_events
  add constraint ranking_events_tournament_id_fkey
  foreign key (tournament_id) references tournaments(id) on delete cascade;

alter table ranking_events drop constraint if exists ranking_events_match_id_fkey;
alter table ranking_events
  add constraint ranking_events_match_id_fkey
  foreign key (match_id) references matches(id) on delete cascade;

-- ranking_rules NO se borra: es una regla reutilizable ("ganar vale 3
-- puntos"), no algo que dependa de que el torneo siga existiendo. Si
-- se borra el torneo al que estaba atada, la regla se queda pero pasa
-- a aplicar a "cualquier torneo" en vez de a uno puntual.
alter table ranking_rules drop constraint if exists ranking_rules_tournament_id_fkey;
alter table ranking_rules
  add constraint ranking_rules_tournament_id_fkey
  foreign key (tournament_id) references tournaments(id) on delete set null;

-- matches.court_id: al borrar una cancha (algo que en la practica pasa
-- junto con borrar el torneo entero, ya que las canchas de este sistema
-- son por torneo), los partidos no deberian desaparecer — alcanza con
-- que se queden sin cancha asignada. Igual que con las parejas, "set
-- null" en vez de "cascade" para no arriesgarse a borrar de rebote un
-- partido que no tiene nada que ver.
alter table matches drop constraint if exists matches_court_id_fkey;
alter table matches
  add constraint matches_court_id_fkey
  foreign key (court_id) references courts(id) on delete set null;
