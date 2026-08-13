-- ============================================================
-- PLATAFORMA DE TORNEOS — 7. Perfiles automaticos al iniciar sesion
-- ============================================================
-- Cuando alguien inicia sesion con Google por primera vez, Supabase
-- crea una fila en "auth.users" (una tabla que ya administra Supabase,
-- no la tocamos). Esta funcion + trigger se encarga de crear
-- automaticamente la fila correspondiente en "profiles" (la tabla
-- nuestra, ya creada en 002-torneos-catalogo.sql).
--
-- IMPORTANTE, a proposito: el perfil nuevo se crea con
--   role = 'referee'  (arbitro, el mas bajo)
--   active = false    (INACTIVO)
-- Esto es a proposito: cualquiera con una cuenta de Google puede
-- iniciar sesion (eso no lo podemos evitar), pero mientras el admin
-- no lo active a mano desde el panel, esa persona no puede tocar
-- nada. Iniciar sesion =/= tener permiso.
-- ============================================================

create or replace function handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into profiles (id, email, full_name, avatar_url, role, active)
  values (
    new.id,
    new.email,
    coalesce(new.raw_user_meta_data ->> 'full_name', new.raw_user_meta_data ->> 'name'),
    new.raw_user_meta_data ->> 'avatar_url',
    'referee',
    false
  )
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function handle_new_user();

-- ------------------------------------------------------------
-- PASO MANUAL, UNA SOLA VEZ:
-- Iniciar sesion primero con la cuenta de Google que va a ser admin,
-- y RECIEN DESPUES correr esto (reemplazando el email):
--
--   update profiles set role = 'admin', active = true
--   where email = 'jntorres2014@gmail.com';
--
-- Si el dia de mañana queres cambiar de cuenta admin: la cuenta
-- nueva inicia sesion una vez (queda creada como arbitro inactivo),
-- corres el mismo update con su email, y opcionalmente desactivas
-- la vieja con "update profiles set active = false where email = '...'".
-- ------------------------------------------------------------
