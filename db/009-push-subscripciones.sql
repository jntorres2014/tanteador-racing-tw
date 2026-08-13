-- ============================================================
-- PLATAFORMA DE TORNEOS — 9. Suscripciones a notificaciones (paso 1)
-- ============================================================
-- Primer paso de "avisarme cuando falten pocos partidos para el
-- mio": esta tabla guarda, por cada pareja de un torneo, quienes
-- pidieron que les avisen (el "objeto de suscripcion" que genera el
-- propio navegador al aceptar notificaciones).
--
-- IMPORTANTE: este paso SOLO guarda la suscripcion. Todavia no hay
-- nada que efectivamente mande el aviso — eso es el proximo paso
-- (necesita revisar la cola de cada cancha y disparar el push con
-- las claves VAPID). Sin esa parte, suscribirse no hace nada visible
-- todavia mas que quedar guardado.
--
-- No requiere login: cualquiera que este mirando "en vivo" puede
-- suscribirse a una pareja sin crear cuenta.
-- ============================================================

create table if not exists push_subscriptions (
  id uuid primary key default gen_random_uuid(),
  pair_id uuid not null references tournament_pairs(id) on delete cascade,
  endpoint text not null,
  p256dh text not null,
  auth text not null,
  created_at timestamptz not null default now(),
  unique (pair_id, endpoint)
);

create index if not exists idx_push_subscriptions_pair
  on push_subscriptions (pair_id);

alter table push_subscriptions enable row level security;

-- Cualquiera puede suscribirse (no requiere login).
drop policy if exists "push_subscriptions: cualquiera se suscribe" on push_subscriptions;
create policy "push_subscriptions: cualquiera se suscribe"
  on push_subscriptions for insert
  with check (true);

-- Nadie puede LEER la lista de suscriptores salvo un admin (son datos
-- tecnicos que solo hacen falta para mandar los avisos, no para
-- mostrar nada en pantalla). El servidor que en el proximo paso
-- efectivamente manda los avisos usa una clave especial que se salta
-- estos permisos, asi que no necesita una policy de lectura publica.
drop policy if exists "push_subscriptions: admin administra" on push_subscriptions;
create policy "push_subscriptions: admin administra"
  on push_subscriptions for all
  using (is_admin())
  with check (is_admin());
