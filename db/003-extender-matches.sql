-- ============================================================
-- PLATAFORMA DE TORNEOS — 3. EXTENDER "matches" (no reemplazar)
-- ============================================================
-- Le agrega a la tabla "matches" que YA USA el tanteador las
-- columnas que necesita la plataforma de torneos. Todas las columnas
-- nuevas son OPCIONALES (nullable): un partido cargado a mano desde
-- el tanteador simple (como hoy) sigue funcionando exactamente igual,
-- sin tocar ninguna de estas columnas. Un partido que viene de un
-- fixture de torneo, ademas, tiene esto completo.
--
-- No se borra ni se renombra ninguna columna existente: control.html,
-- display.html, live.html e historial.html siguen funcionando sin
-- ningun cambio de codigo despues de correr esto.
-- ============================================================

alter table matches add column if not exists tournament_id uuid references tournaments(id);
alter table matches add column if not exists tournament_day_id uuid references tournament_days(id);
alter table matches add column if not exists category_id uuid references categories(id);
alter table matches add column if not exists court_id uuid references courts(id);
alter table matches add column if not exists group_id uuid references groups(id);

alter table matches add column if not exists match_number int;
alter table matches add column if not exists sequence_order int;

alter table matches add column if not exists pair_a_id uuid references tournament_pairs(id);
alter table matches add column if not exists pair_b_id uuid references tournament_pairs(id);
alter table matches add column if not exists winner_pair_id uuid references tournament_pairs(id);

alter table matches add column if not exists referee_user_id uuid references profiles(id);

alter table matches add column if not exists scheduled_time timestamptz;
alter table matches add column if not exists estimated_time timestamptz;
alter table matches add column if not exists actual_started_at timestamptz;
alter table matches add column if not exists actual_finished_at timestamptz;

create index if not exists idx_matches_court_sequence on matches (court_id, sequence_order);
create index if not exists idx_matches_tournament on matches (tournament_id, category_id);
create index if not exists idx_matches_referee on matches (referee_user_id);

-- match_slots: cruces "Ganador Partido N". match_id/source_match_id
-- son TEXT porque matches.id es un codigo corto (ej "ab12cd"), no uuid.
create table if not exists match_slots (
  id uuid primary key default gen_random_uuid(),
  match_id text not null references matches(id) on delete cascade,
  side text not null check (side in ('A', 'B')),
  source_type text not null check (source_type in ('pair', 'winner_of', 'loser_of')),
  pair_id uuid references tournament_pairs(id),
  source_match_id text references matches(id),
  resolved_pair_id uuid references tournament_pairs(id),
  raw_source_text text,
  created_at timestamptz not null default now(),
  unique (match_id, side)
);

-- historial de eventos del marcador, para trazabilidad (opcional,
-- no lo usa el tanteador simple hoy; lo va a usar el arbitro autenticado)
create table if not exists match_score_events (
  id uuid primary key default gen_random_uuid(),
  match_id text not null references matches(id) on delete cascade,
  event_type text not null,
  side text check (side in ('A', 'B')),
  old_value jsonb,
  new_value jsonb,
  created_at timestamptz not null default now(),
  created_by uuid references profiles(id)
);

create index if not exists idx_match_score_events_match on match_score_events (match_id, created_at);

-- Cola de cancha para partidos de torneo: se calcula sobre
-- sequence_order + is_finished + actual_started_at, sin agregar un
-- estado paralelo a "match_status"/"is_finished" que ya usa el
-- tanteador (para no tener dos fuentes de verdad del estado).
--   pending  = actual_started_at is null
--   playing  = actual_started_at is not null and not is_finished
--   finished = is_finished
create or replace view court_queue as
select
  m.*,
  case
    when m.is_finished then 'finished'
    when m.actual_started_at is not null then 'playing'
    else 'pending'
  end as computed_status,
  case when m.actual_started_at is null then
    row_number() over (
      partition by m.court_id
      order by m.sequence_order
    )
  end as position_in_queue
from matches m
where m.court_id is not null
order by m.court_id, m.sequence_order;

create or replace view group_standings as
select
  gm.group_id,
  gm.pair_id,
  tp.display_name as pair_display_name,
  count(m.id) filter (where m.is_finished) as played,
  count(m.id) filter (where m.is_finished and m.winner_pair_id = gm.pair_id) as won,
  count(m.id) filter (where m.is_finished and m.winner_pair_id is not null and m.winner_pair_id <> gm.pair_id) as lost,
  coalesce(sum(case when m.pair_a_id = gm.pair_id then m.score_a - m.score_b
                     when m.pair_b_id = gm.pair_id then m.score_b - m.score_a
                     else 0 end) filter (where m.is_finished), 0) as points_diff
from group_members gm
join tournament_pairs tp on tp.id = gm.pair_id
left join matches m
  on m.group_id = gm.group_id
  and (m.pair_a_id = gm.pair_id or m.pair_b_id = gm.pair_id)
group by gm.group_id, gm.pair_id, tp.display_name;
