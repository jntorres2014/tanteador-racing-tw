-- ============================================================
-- PLATAFORMA DE TORNEOS — 8. Permisos reales (cierra el hueco de
-- seguridad: el login ya existe, ahora lo conectamos de verdad)
-- ============================================================
-- Hasta ahora:
--  - "matches" tenia permisos abiertos de siempre (using(true)),
--    protegidos solo por un PIN visible en el codigo (no era
--    proteccion real).
--  - Las tablas nuevas (categories, seasons, tournaments, etc.)
--    tenian policies TEMPORALES que dejaban escribir sin login
--    (006-rls-temporal-importador.sql), porque todavia no existia
--    el login. Ya existe: las cerramos.
--
-- Regla nueva para "matches":
--  - Cualquiera puede LEER (sigue igual: la pantalla publica y el
--    "en vivo" no necesitan login).
--  - Para CREAR o EDITAR un partido hace falta estar logueado y
--    activo, y ademas:
--      - un admin puede tocar cualquier partido, siempre.
--      - un arbitro solo puede tocar el partido que tiene asignado
--        (matches.referee_user_id = su propio usuario).
--      - un partido de torneo SIN arbitro asignado todavia
--        (referee_user_id vacio) solo lo puede tocar un admin,
--        hasta que se lo asignen (panel de admin, proximo paso).
-- ============================================================

create or replace function auth_is_active()
returns boolean as $$
  select exists (
    select 1 from profiles
    where id = auth.uid() and active = true
  );
$$ language sql stable security definer set search_path = public;

-- ------------------------------------------------------------
-- matches: reemplaza las policies abiertas de 001-multi-cancha.sql
-- ------------------------------------------------------------
drop policy if exists "Escritura publica matches" on matches;
create policy "matches: admin o arbitro asignado edita"
  on matches for update
  using (is_admin() or (referee_user_id = auth.uid() and auth_is_active()))
  with check (is_admin() or (referee_user_id = auth.uid() and auth_is_active()));

drop policy if exists "Creacion publica matches" on matches;
create policy "matches: usuario activo crea partido"
  on matches for insert
  with check (auth_is_active() and (is_admin() or referee_user_id = auth.uid()));

-- "Lectura publica matches" (SELECT) no se toca: sigue abierta para
-- que display.html / live.html / torneos.html funcionen sin login.

-- ------------------------------------------------------------
-- Cierre de las policies temporales del importador (006). Ahora que
-- el login real existe, is_admin() funciona de verdad, y estas ya
-- no hacen falta.
-- ------------------------------------------------------------
do $$
declare
  t text;
begin
  foreach t in array array['categories','seasons','clubs','players','tournaments',
                            'tournament_days','courts','tournament_pairs','match_slots']
  loop
    execute format('drop policy if exists "%s: escritura temporal (sin auth)" on %I', t, t);
    execute format('drop policy if exists "%s: actualizacion temporal (sin auth)" on %I', t, t);
  end loop;
end $$;

drop policy if exists "tournaments: lectura temporal de borradores (sin auth)" on tournaments;
-- Un admin logueado ya puede ver sus propios borradores gracias a la
-- policy original de 004-rls-torneos.sql ("status <> 'draft' or is_admin()").
