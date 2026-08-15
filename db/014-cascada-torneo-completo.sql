-- ============================================================
-- PLATAFORMA DE TORNEOS — 14. Borrar un torneo entero de una sola vez
-- ============================================================
-- Hasta ahora, para borrar un torneo habia que borrar primero sus
-- match_slots, despues sus matches, y recien ahi el torneo (la
-- migracion 013 ya arreglo la parte de match_slots). Esta migracion
-- agrega el ultimo eslabon que faltaba: la referencia de "matches"
-- hacia "tournaments" tampoco borraba en cascada.
--
-- Con este cambio, borrar un torneo completo (y TODO lo que dependa
-- de el: partidos, cruces, parejas, canchas, dias) se reduce a UNA
-- sola instruccion:
--
--   delete from tournaments where id = '...';
--
-- Esto es lo que usa el boton nuevo "Borrar torneo" en torneos.html
-- (solo visible para admin, pide confirmar escribiendo el nombre del
-- torneo antes de borrar — no hay forma de tocarlo por accidente).
-- ============================================================

alter table matches drop constraint if exists matches_tournament_id_fkey;
alter table matches
  add constraint matches_tournament_id_fkey
  foreign key (tournament_id) references tournaments(id) on delete cascade;
