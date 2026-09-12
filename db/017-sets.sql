-- ============================================================
-- TANTEADOR RACING CLUB TW — 17. Partidos a sets
-- ============================================================
-- Le agrega a "matches" la posibilidad de jugar a mejor de 3 o
-- mejor de 5 sets, en vez de un solo set a "tantos a jugar" como
-- hasta ahora. Todo lo nuevo es opcional y con default que
-- reproduce el comportamiento de siempre:
--
--   sets_to_win = 1  ->  el partido es un solo set (igual que hoy,
--                        no cambia nada para los partidos existentes
--                        ni para uno nuevo que no elija formato).
--   sets_to_win = 2  ->  mejor de 3 sets (gana quien llega a 2).
--   sets_to_win = 3  ->  mejor de 5 sets (gana quien llega a 3).
--
-- control.html/display.html/historial.html/live.html/torneos.html
-- siguen funcionando sin cambios para cualquier partido que tenga
-- sets_to_win = 1 (el default).
-- ============================================================

alter table matches add column if not exists sets_to_win int not null default 1;
alter table matches add column if not exists sets_a int not null default 0;
alter table matches add column if not exists sets_b int not null default 0;
alter table matches add column if not exists current_set int not null default 1;
alter table matches add column if not exists set_history jsonb not null default '[]'::jsonb;

comment on column matches.sets_to_win is 'Sets necesarios para ganar el partido. 1 = un solo set (comportamiento clasico).';
comment on column matches.sets_a is 'Sets ganados por el equipo A hasta el momento.';
comment on column matches.sets_b is 'Sets ganados por el equipo B hasta el momento.';
comment on column matches.current_set is 'Numero de set que se esta jugando ahora mismo (1-indexado).';
comment on column matches.set_history is 'Array de sets ya jugados: [{"set":1,"score_a":30,"score_b":24}, ...]. Se completa cuando termina cada set, no el actual.';
