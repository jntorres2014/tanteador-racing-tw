-- ============================================================
-- PLATAFORMA DE TORNEOS — 4. RLS de las tablas nuevas
-- ============================================================
-- OJO: esto NO toca las policies de "matches", que siguen siendo las
-- abiertas de siempre (using(true)) para no romper el tanteador
-- simple, que hoy controla el acceso con el PIN, no con Auth.
-- Cuando se conecte el login con Google (Fase 3), ahi se cierra
-- "matches" tambien. Documentado como riesgo conocido en el README.
-- ============================================================

create or replace function is_admin()
returns boolean as $$
  select exists (
    select 1 from profiles
    where id = auth.uid() and role = 'admin' and active = true
  );
$$ language sql stable security definer set search_path = public;

-- catalogos: lectura publica, solo admin escribe
alter table clubs enable row level security;
alter table categories enable row level security;
alter table seasons enable row level security;
alter table players enable row level security;
alter table tournaments enable row level security;
alter table tournament_days enable row level security;
alter table courts enable row level security;
alter table tournament_pairs enable row level security;
alter table groups enable row level security;
alter table group_members enable row level security;
alter table ranking_rules enable row level security;
alter table ranking_events enable row level security;

do $$
declare
  t text;
begin
  foreach t in array array['clubs','categories','seasons','players','groups','group_members','ranking_rules','ranking_events']
  loop
    execute format('drop policy if exists "%s: lectura publica" on %I', t, t);
    execute format('create policy "%s: lectura publica" on %I for select using (true)', t, t);
    execute format('drop policy if exists "%s: admin administra" on %I', t, t);
    execute format('create policy "%s: admin administra" on %I for all using (is_admin()) with check (is_admin())', t, t);
  end loop;
end $$;

-- tournaments: publico solo ve lo publicado
drop policy if exists "tournaments: lectura publica de publicados" on tournaments;
create policy "tournaments: lectura publica de publicados"
  on tournaments for select using (status <> 'draft' or is_admin());
drop policy if exists "tournaments: admin administra" on tournaments;
create policy "tournaments: admin administra" on tournaments for all using (is_admin()) with check (is_admin());

drop policy if exists "tournament_days: lectura publica" on tournament_days;
create policy "tournament_days: lectura publica" on tournament_days for select using (true);
drop policy if exists "tournament_days: admin administra" on tournament_days;
create policy "tournament_days: admin administra" on tournament_days for all using (is_admin()) with check (is_admin());

drop policy if exists "courts: lectura publica" on courts;
create policy "courts: lectura publica" on courts for select using (true);
drop policy if exists "courts: admin administra" on courts;
create policy "courts: admin administra" on courts for all using (is_admin()) with check (is_admin());

drop policy if exists "tournament_pairs: lectura publica" on tournament_pairs;
create policy "tournament_pairs: lectura publica" on tournament_pairs for select using (true);
drop policy if exists "tournament_pairs: admin administra" on tournament_pairs;
create policy "tournament_pairs: admin administra" on tournament_pairs for all using (is_admin()) with check (is_admin());

-- profiles
alter table profiles enable row level security;
drop policy if exists "profiles: el propio usuario ve su perfil" on profiles;
create policy "profiles: el propio usuario ve su perfil" on profiles for select using (id = auth.uid() or is_admin());
drop policy if exists "profiles: admin administra perfiles" on profiles;
create policy "profiles: admin administra perfiles" on profiles for all using (is_admin()) with check (is_admin());
drop policy if exists "profiles: usuario nuevo crea su propio perfil" on profiles;
create policy "profiles: usuario nuevo crea su propio perfil" on profiles for insert with check (id = auth.uid());

-- match_slots / match_score_events: lectura publica basica, escritura por definer functions
alter table match_slots enable row level security;
drop policy if exists "match_slots: lectura publica" on match_slots;
create policy "match_slots: lectura publica" on match_slots for select using (true);
drop policy if exists "match_slots: admin administra" on match_slots;
create policy "match_slots: admin administra" on match_slots for all using (is_admin()) with check (is_admin());

alter table match_score_events enable row level security;
drop policy if exists "match_score_events: lectura publica" on match_score_events;
create policy "match_score_events: lectura publica" on match_score_events for select using (true);
drop policy if exists "match_score_events: admin inserta" on match_score_events;
create policy "match_score_events: admin inserta" on match_score_events for insert with check (is_admin());

-- audit_logs: solo admin
alter table audit_logs enable row level security;
drop policy if exists "audit_logs: solo admin lee" on audit_logs;
create policy "audit_logs: solo admin lee" on audit_logs for select using (is_admin());
