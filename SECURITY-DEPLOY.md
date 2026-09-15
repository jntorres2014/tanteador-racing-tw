# Despliegue seguro

Este cambio mantiene las pantallas y el flujo actual, pero el orden de
despliegue es importante para evitar que el frontend llame funciones que
todavia no existen.

## 1. Preparar Supabase

1. Abrir Supabase Dashboard > SQL Editor.
2. Ejecutar completo `db/018-security-hardening.sql`.
3. Confirmar que finaliza con `Success`. La migracion usa una transaccion:
   ante cualquier error no deja cambios parciales.
4. En Edge Functions > Secrets, crear `MATCH_WEBHOOK_SECRET` con un valor
   aleatorio largo.
5. Configurar el Database Webhook para enviar ese mismo valor en el encabezado
   `x-webhook-secret`.
6. Desplegar nuevamente `notify-match-queue` y `send-test-push`.

## 2. Verificaciones antes del frontend

Ejecutar estas comprobaciones desde una sesion de prueba:

- visitante anonimo: puede ver partidos y torneos publicados;
- visitante anonimo: no puede ejecutar `finalize_match`;
- usuario pendiente: no puede crear ni modificar partidos;
- arbitro activo: solo puede editar/finalizar su partido asignado;
- arbitro activo: puede crear un partido suelto, pero no uno de torneo;
- administrador: conserva altas, importacion, asignacion y correcciones;
- campana: registra una suscripcion para un torneo publicado;
- webhook sin secreto o con secreto incorrecto: responde 401/500 y no modifica
  los flags de aviso.

## 3. Publicar el frontend

Fusionar el pull request solo despues de completar los pasos anteriores.
Cloudflare desplegara desde `main`. El archivo `.assetsignore` evita publicar
SQL, funciones internas, planillas y documentacion; `_headers` agrega las
cabeceras defensivas.

## 4. Prueba funcional corta

1. Iniciar sesion como administrador.
2. Crear un torneo de prueba, una cancha, una pareja y un partido.
3. Asignar un arbitro activo.
4. Cargar puntos, saque y cronometro desde `control.html`.
5. Verificar `display.html`, `obs-cancha.html` y `live.html`.
6. Finalizar el partido y comprobar cruces, historial y ranking.
7. Importar un fixture pequeño y confirmar que la previsualizacion es correcta.
8. Probar una URL HTTPS de YouTube y confirmar que otros dominios se rechazan
   en la vista publica.

## 5. Configuracion manual de GitHub

En Settings > Branches, proteger `main`:

- Require a pull request before merging.
- Require status checks to pass: `Security checks`.
- Do not allow bypassing the above settings.

Los datos personales que ya estuvieron en el historial de un repositorio
publico requieren una decision separada: volver privado el repositorio o
reescribir su historial. No se realiza automaticamente porque altera clones y
enlaces existentes.
