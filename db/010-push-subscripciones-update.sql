-- ============================================================
-- PLATAFORMA DE TORNEOS — 10. Arreglo: permitir actualizar suscripciones
-- ============================================================
-- El boton "Avisarme" hace un UPSERT (inserta o actualiza si ya
-- existia una suscripcion para esa pareja + ese navegador). La
-- migracion 009 solo dejaba INSERT para "cualquiera", por eso al
-- tocar la campanita una segunda vez (o si el navegador ya tenia la
-- suscripcion guardada) Postgres rechazaba el UPDATE con un error de
-- RLS.
--
-- Esta migracion agrega el permiso de UPDATE que faltaba. No hace
-- falta tocar la de lectura: eso sigue reservado solo para admin.
-- ============================================================

drop policy if exists "push_subscriptions: cualquiera actualiza su suscripcion" on push_subscriptions;
create policy "push_subscriptions: cualquiera actualiza su suscripcion"
  on push_subscriptions for update
  using (true)
  with check (true);
