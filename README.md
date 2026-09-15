# Tanteador Racing Club TW

Tanteador en vivo para pelota paleta. HTML plano + Supabase (Postgres + Realtime),
desplegado en Cloudflare Workers.

## Pantallas

| Archivo | Para quien | Uso |
|---|---|---|
| `index.html` | Organizador | Menu: lista los partidos activos y permite crear uno nuevo |
| `control.html?m=CODIGO` | Operador de la cancha | Carga tantos, saque, cronometro, EN VIVO, finalizar |
| `display.html?m=CODIGO` | OBS / proyector | Marcador con fondo transparente, sin controles |
| `live.html` | Publico | Todos los partidos marcados EN VIVO a la vez |
| `historial.html` | Publico | Partidos finalizados |

Cada partido tiene un codigo corto propio (`?m=ab12cd`), asi que se pueden usar
varias canchas en simultaneo, cada una con su link de control y de display.

## Configuracion

`supabase-config.js` es el unico archivo a editar: `SUPABASE_URL`,
`SUPABASE_ANON_KEY` y `CONTROL_PIN`.

## Base de datos

Las migraciones estan en `db/`, en orden. Se corren copiandolas en
Supabase Dashboard -> SQL Editor -> New query -> Run.

- `001-multi-cancha.sql` — crea la tabla `matches`. Reemplaza el esquema viejo
  de una sola cancha (`match_state` / `match_live`), que queda sin uso.

## Deploy

Push a `main` -> Cloudflare redeploya solo en menos de un minuto.
No hay ambiente de staging: lo que se pushea sale en vivo.

## Seguridad y despliegue

- La clave publica de Supabase se sirve al navegador por diseño; los permisos
  reales se controlan con RLS y funciones autorizadas.
- Para una instalacion nueva, ejecutar todas las migraciones de `db/` en orden,
  incluida `018-security-hardening.sql`.
- Antes de desplegar `notify-match-queue`, configurar
  `MATCH_WEBHOOK_SECRET` y enviar el mismo valor desde el Database Webhook.
- Los cambios deben entrar por pull request y pasar `Security checks` antes de
  fusionarse con `main`.
- La finalizacion de partidos no tiene fallback directo: si la operacion segura
  falla, el marcador conserva el ultimo estado confirmado y muestra el error.

Ver `SECURITY-DEPLOY.md` para la verificacion posterior al despliegue.
