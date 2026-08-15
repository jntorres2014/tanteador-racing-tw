-- ============================================================
-- PLATAFORMA DE TORNEOS — 13. Borrado en cascada para match_slots
-- ============================================================
-- Hoy, borrar un torneo de prueba obliga a hacerlo en 3 pasos a mano
-- (primero match_slots, despues matches, despues tournaments) porque
-- la referencia "source_match_id" de match_slots (el "Ganador Partido
-- N" que apunta a OTRO partido) no tenia "on delete cascade" — a
-- diferencia de "match_id", que si lo tenia.
--
-- Con este cambio, borrar un torneo entero vuelve a ser tan simple
-- como:
--
--   delete from matches where tournament_id = '...';
--   delete from tournaments where id = '...';
--
-- (el resto — parejas, canchas, cruces — se borra solo, en cascada).
--
-- Nota para el futuro: esto asume que cuando se borra un partido, es
-- porque se esta borrando TODO el torneo junto. Si alguna vez se
-- quisiera borrar un solo partido suelto (no el torneo entero) y ese
-- partido era la referencia "Ganador Partido N" de otro, con este
-- cambio esa referencia se borra en silencio junto con el. Para el
-- uso actual (limpiar torneos de prueba) esto es lo que conviene.
-- ============================================================

alter table match_slots drop constraint if exists match_slots_source_match_id_fkey;
alter table match_slots
  add constraint match_slots_source_match_id_fkey
  foreign key (source_match_id) references matches(id) on delete cascade;
