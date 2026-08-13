-- ============================================================
-- PLATAFORMA DE TORNEOS — 2. CATALOGO (se suma al tanteador existente)
-- ============================================================
-- Correr en el MISMO proyecto de Supabase donde ya corriste
-- "001-multi-cancha.sql" (el del tanteador). No crea un proyecto
-- nuevo ni una base de datos nueva: todo vive junto.
--
-- Este archivo solo AGREGA tablas nuevas. No toca "matches" (eso lo
-- hace 003-extender-matches.sql, despues de este).
-- ============================================================

create extension if not exists "pgcrypto";

create or replace function set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

-- ------------------------------------------------------------
-- Identidad y roles (para cuando se agregue login con Google)
-- ------------------------------------------------------------
create table if not exists profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  email text,
  full_name text,
  avatar_url text,
  role text not null default 'referee' check (role in ('admin', 'referee')),
  active boolean not null default true,
  created_at timestamptz not null default now()
);

-- ------------------------------------------------------------
-- Catalogos globales
-- ------------------------------------------------------------
create table if not exists clubs (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  city text,
  created_at timestamptz not null default now(),
  unique (name, city)
);

create table if not exists categories (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,          -- ej: '50', '56', '61A', '61B', '65'
  display_order int not null default 0,
  active boolean not null default true
);

create table if not exists seasons (
  id uuid primary key default gen_random_uuid(),
  year int not null unique,
  active boolean not null default true
);

-- ------------------------------------------------------------
-- Jugadores
-- ------------------------------------------------------------
create table if not exists players (
  id uuid primary key default gen_random_uuid(),
  first_name text,
  last_name text not null,
  display_name text not null,
  club_id uuid references clubs(id),
  city text,
  birth_year int,
  active boolean not null default true,
  auth_user_id uuid references auth.users(id),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

drop trigger if exists players_set_updated_at on players;
create trigger players_set_updated_at
  before update on players
  for each row execute function set_updated_at();

create index if not exists idx_players_last_name on players (lower(last_name));

-- ------------------------------------------------------------
-- Torneos, jornadas, canchas
-- ------------------------------------------------------------
create table if not exists tournaments (
  id uuid primary key default gen_random_uuid(),
  season_id uuid not null references seasons(id),
  name text not null,
  edition text,
  venue text,
  city text,
  start_date date,
  end_date date,
  default_start_time time,
  status text not null default 'draft'
    check (status in ('draft', 'published', 'in_progress', 'finished', 'archived')),
  logo_url text,
  secondary_logo_url text,
  primary_color text,
  secondary_color text,
  public_slug text unique,
  created_by uuid references profiles(id),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

drop trigger if exists tournaments_set_updated_at on tournaments;
create trigger tournaments_set_updated_at
  before update on tournaments
  for each row execute function set_updated_at();

create table if not exists tournament_days (
  id uuid primary key default gen_random_uuid(),
  tournament_id uuid not null references tournaments(id) on delete cascade,
  play_date date not null,
  default_start_time time,
  created_at timestamptz not null default now(),
  unique (tournament_id, play_date)
);

-- OJO: esta tabla "courts" (canchas de un TORNEO, con orden de cola)
-- es distinta de una "cancha" suelta del tanteador simple: el
-- tanteador simple no necesita cancha, solo usa "matches.label" como
-- texto libre. Una cancha de torneo es un objeto real con cola de
-- partidos (sequence_order).
create table if not exists courts (
  id uuid primary key default gen_random_uuid(),
  tournament_id uuid not null references tournaments(id) on delete cascade,
  name text not null,
  display_order int not null default 0,
  active boolean not null default true,
  created_at timestamptz not null default now()
);

-- ------------------------------------------------------------
-- Parejas de torneo
-- ------------------------------------------------------------
create table if not exists tournament_pairs (
  id uuid primary key default gen_random_uuid(),
  tournament_id uuid not null references tournaments(id) on delete cascade,
  category_id uuid not null references categories(id),
  player_1_id uuid references players(id),
  player_2_id uuid references players(id),
  display_name text not null,
  raw_display_name text not null,
  created_at timestamptz not null default now()
);

create index if not exists idx_tournament_pairs_tournament
  on tournament_pairs (tournament_id, category_id);

-- ------------------------------------------------------------
-- Zonas / grupos (todos contra todos)
-- ------------------------------------------------------------
create table if not exists groups (
  id uuid primary key default gen_random_uuid(),
  tournament_id uuid not null references tournaments(id) on delete cascade,
  category_id uuid not null references categories(id),
  name text not null,
  created_at timestamptz not null default now()
);

create table if not exists group_members (
  group_id uuid not null references groups(id) on delete cascade,
  pair_id uuid not null references tournament_pairs(id) on delete cascade,
  primary key (group_id, pair_id)
);

-- ------------------------------------------------------------
-- Ranking: reglas + libro mayor de eventos
-- ------------------------------------------------------------
create table if not exists ranking_rules (
  id uuid primary key default gen_random_uuid(),
  season_id uuid not null references seasons(id),
  event_type text not null,
  points int not null,
  category_id uuid references categories(id),
  tournament_id uuid references tournaments(id),
  active boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists ranking_events (
  id uuid primary key default gen_random_uuid(),
  player_id uuid not null references players(id),
  season_id uuid not null references seasons(id),
  category_id uuid not null references categories(id),
  tournament_id uuid references tournaments(id),
  match_id text references matches(id),   -- text: matches.id es codigo corto, no uuid
  event_type text not null,
  points int not null,
  description text,
  created_at timestamptz not null default now(),
  created_by uuid references profiles(id),
  source_key text not null unique
);

create index if not exists idx_ranking_events_player_season
  on ranking_events (player_id, season_id, category_id);

-- ------------------------------------------------------------
-- Auditoria general
-- ------------------------------------------------------------
create table if not exists audit_logs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id),
  action text not null,
  entity_type text not null,
  entity_id text,
  metadata jsonb,
  created_at timestamptz not null default now()
);

-- ------------------------------------------------------------
-- Vista: ranking acumulado por jugador/categoria/temporada
-- ------------------------------------------------------------
create or replace view ranking_totals as
select
  re.player_id,
  p.display_name as player_display_name,
  re.season_id,
  s.year as season_year,
  re.category_id,
  c.name as category_name,
  sum(re.points) as total_points
from ranking_events re
join players p on p.id = re.player_id
join seasons s on s.id = re.season_id
join categories c on c.id = re.category_id
group by re.player_id, p.display_name, re.season_id, s.year, re.category_id, c.name;
