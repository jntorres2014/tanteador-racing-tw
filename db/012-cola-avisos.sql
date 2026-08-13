-- ============================================================
-- PLATAFORMA DE TORNEOS — 12. Aviso automático por cola de cancha
-- ============================================================
-- Estas columnas guardan si YA se mandó cada aviso para un partido,
-- para no mandarlo de nuevo cada vez que se recalcula la cola (por
-- ejemplo, si dos partidos terminan seguidos en la misma cancha).
--
--   notified_2_before -> ya se avisó "faltan 2 partidos" para este
--   notified_1_before -> ya se avisó "falta 1 partido" para este
--   notified_started  -> ya se avisó "arrancó" para este
--
-- La logica que decide CUANDO mandarlos vive en la Edge Function
-- "notify-match-queue", que se dispara sola con un Database Webhook
-- cada vez que se actualiza un partido (por ejemplo, al marcarlo
-- como EN VIVO o al finalizarlo).
-- ============================================================

alter table matches add column if not exists notified_2_before boolean not null default false;
alter table matches add column if not exists notified_1_before boolean not null default false;
alter table matches add column if not exists notified_started boolean not null default false;

-- La vista court_queue (creada en 003) usa "m.*", que Postgres "congela"
-- con las columnas que existian en ese momento. Como recien agregamos
-- columnas nuevas a matches, hay que recrear la vista para que las
-- incluya (si no, la funcion que manda los avisos no las va a ver).
-- Hace falta borrarla y crearla de nuevo (no alcanza con "or replace"),
-- porque las columnas nuevas quedan en el medio del listado, no al final.
--
-- De paso, se corrigen DOS problemas que aparecieron al probar esto
-- con datos reales:
--
-- 1) La numeracion "position_in_queue" contaba tambien el partido que
--    ya esta jugando (aunque despues lo mostrara vacio), asi que el
--    "proximo" partido quedaba marcado como posicion 2 en vez de 1.
--    Se arregla calculando la numeracion en una subconsulta que solo
--    incluye los partidos pendientes (no el que ya arranco).
--
-- 2) La cola se calculaba solo "por cancha", pero una misma cancha
--    puede tener partidos de MAS DE UN TORNEO (por ejemplo, si dos
--    torneos comparten canchas el mismo dia). Ahora se calcula "por
--    cancha Y por torneo", para no mezclar la cola de un torneo con
--    la de otro.
drop view if exists court_queue;
create view court_queue as
select
  m.*,
  case
    when m.is_finished then 'finished'
    when m.actual_started_at is not null then 'playing'
    else 'pending'
  end as computed_status,
  pq.position_in_queue
from matches m
left join (
  select id,
    row_number() over (
      partition by court_id, tournament_id
      order by sequence_order
    ) as position_in_queue
  from matches
  where court_id is not null and actual_started_at is null
) pq on pq.id = m.id
where m.court_id is not null
order by m.court_id, m.tournament_id, m.sequence_order;
