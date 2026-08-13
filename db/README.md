# Base de datos — Tanteador + Plataforma de Torneos

Todo vive en **un solo Supabase** (el mismo que ya usa el tanteador) y
**un solo repositorio de GitHub** (`tanteador-racing-tw`). No hay un
proyecto aparte para "la plataforma grande": es una extensión de lo
que ya está funcionando.

## Orden para correr en Supabase

SQL Editor → New query → pegar → Run, uno por uno, EN ESTE ORDEN:

1. `001-multi-cancha.sql` — ya lo corriste. Crea la tabla `matches`
   (el tanteador de varias canchas a la vez).
2. `002-torneos-catalogo.sql` — agrega las tablas nuevas: jugadores,
   torneos, canchas de torneo, parejas, zonas, ranking. No toca nada
   de lo que ya existe.
3. `003-extender-matches.sql` — le agrega a `matches` las columnas que
   necesita un partido de torneo (a qué torneo pertenece, qué pareja
   juega, en qué cancha, en qué orden). Todas son opcionales: un
   partido cargado a mano como hoy no las usa y sigue andando igual.
4. `004-rls-torneos.sql` — permisos de las tablas nuevas. Ojo: **no
   toca los permisos de `matches`**, que siguen siendo los abiertos de
   siempre (los siguen controlando el PIN). Eso se endurece recién
   cuando se conecte el login con Google.
5. `005-finalize-match.sql` — la función que finaliza un partido:
   sirve tanto para uno suelto (como hoy) como para uno de torneo (ahí
   además resuelve "Ganador Partido N" automáticamente).
6. `006-rls-temporal-importador.sql` — habilita que `importar-fixture.html`
   pueda escribir sin login (todavía no existe Auth). **Riesgo
   documentado**: hay que borrar estas policies el día que se conecte
   el login con Google, dejando solo las de admin de `004`.
7. `seed.sql` — carga tu ranking real 2025 (196 jugadores). Se genera
   con `generate_seed.py`; si el organizador manda una planilla
   nueva, correr el script de nuevo la regenera.

Los siete son **re-ejecutables**: no pasa nada si los corrés dos veces.

## El importador de fixture

`importar-fixture.html` (en la raíz del repo, junto a `index.html`) es
la pantalla para cargar un Excel de fixture. Sigue el flujo del
prompt maestro: subir → leer → previsualizar advertencias → recién
ahí confirmar. Nunca inserta nada sin que lo veas primero.

Se probó en un navegador real (no solo revisando el código) contra
una copia exacta del fixture real del 27/09 (18 partidos): separa
bien apellidos compuestos como "Galvan-De Uriarte", reconoce
"Larrañaga Jeckel" sin guion, detecta los 4 errores de tipeo del
archivo real (Fradeja→Fradegas, Benvenuto→Benvenutto,
Bahomende→Bahamonde, Carrio→Carro) sugiriendo la corrección sin
aplicarla sola, marca como ambiguos los casos "Real" y "Rezzonico"
(hay dos personas con ese apellido en la misma categoría) sin elegir
por su cuenta, y arma correctamente los 5 cruces "Ganador Partido N"
del archivo, cada uno apuntando al partido correcto.

Requiere `importar-logic.js` (la lógica de parseo, sin la cual la
página no funciona) en la misma carpeta.

## Qué se probó antes de mandarte esto

Se armó una base Postgres de prueba igual a la tuya (con
`001-multi-cancha.sql` ya corrido), se le sumaron los 5 archivos
nuevos, y se probaron dos casos:

- **Un partido suelto**, cargado igual que hoy en el tanteador
  (sin torneo ni pareja): se finaliza y queda igual que siempre.
- **Un partido de torneo real** (con el fixture del 27/09): al
  finalizar "Partido 1", el partido "Partido 10" — que dependía de
  "Ganador Partido 1" — se completó solo con la pareja correcta.

Y se re-verificó que el ranking de categoría 56 sigue coincidiendo
exacto con la planilla (58 jugadores, 4200 puntos) después de sumar
todo lo demás.

## Qué significa "un partido de torneo" vs "un partido suelto"

La tabla `matches` sirve para las dos cosas:

- **Suelto** (uso de hoy): se crea desde `index.html`, sin
  `tournament_id` ni `pair_a_id`/`pair_b_id`. Funciona exactamente
  como el tanteador actual.
- **De torneo**: además tiene `tournament_id`, `category_id`,
  `court_id`, `pair_a_id`/`pair_b_id` y `sequence_order`. Todavía no
  hay una pantalla para cargarlos así — hoy solo se puede por SQL. Esa
  pantalla (el importador del fixture) es el próximo paso.
