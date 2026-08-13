-- ============================================================
-- PLATAFORMA DE TORNEOS — 6. RLS TEMPORAL para el importador
-- ============================================================
-- RIESGO CONOCIDO, A CERRAR CUANDO LLEGUE EL LOGIN CON GOOGLE.
--
-- 004-rls-torneos.sql dejo estas tablas en "solo admin escribe", pero
-- todavia no existe el login (Fase 3), asi que ningun usuario puede
-- ser "admin" de verdad. Para que "importar-fixture.html" pueda
-- funcionar HOY, se agrega una policy de escritura publica temporal
-- sobre las tablas que usa el importador — el mismo criterio que ya
-- se usa en "matches" desde el tanteador original (protegido por el
-- PIN de la interfaz, no por la base de datos).
--
-- Cuando se conecte Google Auth: BORRAR las policies "... temporal"
-- de este archivo (dejar solo las de admin de 004-rls-torneos.sql).
-- ============================================================

do $$
declare
  t text;
begin
  foreach t in array array['categories','seasons','clubs','players','tournaments',
                            'tournament_days','courts','tournament_pairs','match_slots']
  loop
    execute format('drop policy if exists "%s: escritura temporal (sin auth)" on %I', t, t);
    execute format('create policy "%s: escritura temporal (sin auth)" on %I for insert with check (true)', t, t);
    execute format('drop policy if exists "%s: actualizacion temporal (sin auth)" on %I', t, t);
    execute format('create policy "%s: actualizacion temporal (sin auth)" on %I for update using (true) with check (true)', t, t);
  end loop;
end $$;

-- ------------------------------------------------------------
-- Caso especial: "tournaments" ademas tiene una policy de LECTURA
-- restringida (004-rls-torneos.sql: los torneos en estado "draft"
-- solo los ve un admin). El importador crea el torneo como "draft"
-- y necesita poder leer la fila que acaba de crear (Supabase hace
-- un select automatico despues de cada insert/update para
-- devolverte el resultado). Sin esto, el insert funciona pero falla
-- al intentar devolverlo, y el importador ve un error 401.
--
-- MISMO RIESGO TEMPORAL: borrar esta policy tambien cuando se
-- conecte el login con Google (ahi los torneos en borrador solo
-- los va a poder ver un admin logueado, como estaba pensado).
-- ------------------------------------------------------------
drop policy if exists "tournaments: lectura temporal de borradores (sin auth)" on tournaments;
create policy "tournaments: lectura temporal de borradores (sin auth)"
  on tournaments for select using (true);
