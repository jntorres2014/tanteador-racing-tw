-- ============================================================
-- TANTEADOR RACING CLUB TW - MIGRACION A MULTI-CANCHA
-- ============================================================
-- Copiar y pegar TODO este archivo en:
-- Supabase Dashboard -> SQL Editor -> New query -> Run
--
-- Esto reemplaza el esquema anterior (match_state / match_live,
-- pensado para 1 sola cancha) por una tabla "matches" que soporta
-- varios partidos en simultaneo, cada uno con su propio ID.
-- ============================================================

create table if not exists matches (
  id text primary key,                    -- codigo corto del partido, ej: "abc123"
  label text not null default 'Partido',  -- nombre para identificarlo, ej: "Cancha 1"
  team_a_name text not null default 'Local',
  team_b_name text not null default 'Visitante',
  score_a int not null default 0,
  score_b int not null default 0,
  server text,
  max_points int not null default 30,
  match_status text not null default 'playing',   -- 'playing' | 'A' | 'B'
  timer_accumulated float8 not null default 0,
  timer_running_since bigint,
  is_live boolean not null default false,
  youtube_url text default '',
  is_finished boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Mantiene updated_at al dia en cada cambio
create or replace function set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

drop trigger if exists matches_set_updated_at on matches;
create trigger matches_set_updated_at
  before update on matches
  for each row execute function set_updated_at();

-- Seguridad a nivel de fila
alter table matches enable row level security;

drop policy if exists "Lectura publica matches" on matches;
create policy "Lectura publica matches"
  on matches for select
  using (true);

drop policy if exists "Escritura publica matches" on matches;
create policy "Escritura publica matches"
  on matches for update
  using (true)
  with check (true);

drop policy if exists "Creacion publica matches" on matches;
create policy "Creacion publica matches"
  on matches for insert
  with check (true);

-- Tiempo real (solo si todavia no esta agregada; re-correr esta
-- migracion no falla mas si "matches" ya estaba en la publicacion)
do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime' and tablename = 'matches'
  ) then
    alter publication supabase_realtime add table matches;
  end if;
end $$;

-- ------------------------------------------------------------
-- Opcional: borrar las tablas viejas de la version de 1 sola
-- cancha, si ya no las vas a usar. Descomentar estas dos lineas
-- si queres limpiarlas (no es obligatorio, no molestan si quedan).
-- ------------------------------------------------------------
-- drop table if exists match_state;
-- drop table if exists match_live;
