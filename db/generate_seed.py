#!/usr/bin/env python3
"""
Genera db/seed.sql a partir del ranking historico real
(Ranking Veteranos 2025 Rawson para All Boys.xls).

Decisiones tomadas (documentadas tambien en docs/FASE-0-AUDITORIA.md):

  - Identidad de jugador = (apellido, nombre) normalizados, EXCEPTO
    cuando el mismo (apellido, nombre) aparece con club/ciudad distinto
    en distintas hojas de categoria (ej. "FONSECA, Carlos" en 56 con
    un club y en 61A con otro). En ese caso NO se asume que es la
    misma persona jugando dos categorias: se tratan como DOS jugadores
    separados, cada uno marcado 'club_ambiguous' para revision manual.
    Esta es la unica senial disponible en los datos para distinguir
    "un jugador en dos categorias" de "dos personas con el mismo
    nombre" -- y ya hubo un caso real (Real Daniel / Real Tomas,
    Rezzonico Roberto / Juan Carlos) donde el apellido solo no alcanza.
    Nunca se fusiona ante la duda (regla del prompt maestro §15).

  - Los IDs de players/clubs/categories/seasons/tournaments son UUIDs
    DETERMINISTICOS (uuid5), no aleatorios. Correr el SQL resultante
    dos veces no duplica nada: usa `on conflict (id) do nothing`.

  - event_type = 'historico_importado': el desglose real de puntos
    por instancia (campeon/finalista/semifinal/...) todavia no esta
    confirmado con el organizador (pendiente #1 de la auditoria), asi
    que el punto historico se importa como bloque por sede, no
    desagregado. Cuando se confirme la escala, se puede reprocesar
    (source_key permite volver a correr el import sin duplicar).

  - Se ignora la columna "Puntaje Total 2024" (mal rotulada, y es la
    suma de las 4 sedes: se recalcula sola con la vista ranking_totals).
"""
import re
import unicodedata
import uuid
import xlrd
import pathlib
from collections import defaultdict

SRC = "/root/.claude/uploads/2b5802ac-7258-5e24-9324-4741a1bd0395/edc0b97d-Ranking_Veteranos_2025_Rawson_para_All_Boys.xls"
OUT = pathlib.Path(__file__).parent / "seed.sql"

NS = uuid.UUID("6f1f1a2e-6c1a-4b5e-8f1a-2e6c1a4b5e8f")  # namespace fijo del proyecto

def uid(*parts):
    return str(uuid.uuid5(NS, "|".join(str(p) for p in parts)))

def norm_key(s):
    s = unicodedata.normalize("NFKD", str(s)).encode("ascii", "ignore").decode()
    return re.sub(r"\s+", " ", s).strip().upper()

def club_compare_key(s):
    """Normalizacion laxa SOLO para decidir si dos apariciones son 'el
    mismo club/ciudad', no para el catalogo de clubes en si. El catalogo
    real (`clubs`) conserva las variantes tal cual vienen de la planilla
    (esa limpieza queda pendiente para el admin, ver README/auditoria);
    esta funcion solo evita falsos conflictos de identidad de jugador
    por errores de tipeo como 'Club Pelota'/'Club de Pelota' o
    'Madryn'/'Pto. Madryn'."""
    s = norm_key(s)
    s = s.replace(".", " ")
    s = re.sub(r"\b(PTO|PUERTO|DE|DEL|LA)\b", " ", s)
    return re.sub(r"\s+", "", s)

def sql_str(s):
    if s is None:
        return "null"
    return "'" + str(s).replace("'", "''") + "'"

def title(s):
    return " ".join(w.capitalize() for w in str(s).strip().split())

CATEGORY_SHEETS = {"50": "50", "56": "56", "61 A": "61A", "61 B": "61B", "65": "65"}
SEDE_COLS = {4: "Esquel", 5: "Cipolletti", 6: "Union Vasca", 7: "Rawson"}
SEASON_YEAR = 2025

wb = xlrd.open_workbook(SRC)

season_id = uid("season", SEASON_YEAR)
cat_order = ["50", "56", "61A", "61B", "65"]
category_ids = {c: uid("category", c) for c in cat_order}
tournament_ids = {sede: uid("tournament", SEASON_YEAR, sede) for sede in SEDE_COLS.values()}

clubs = {}  # club_key -> (id, display_name, city)

# ---- pasada 1: leer TODAS las filas crudas de todas las hojas ----
raw_rows = []  # (last, first, base_key, club_key, club_raw, cat, sede, points)
for sheet_name, cat in CATEGORY_SHEETS.items():
    sh = wb.sheet_by_name(sheet_name)
    for r in range(7, sh.nrows):
        raw_name = str(sh.cell_value(r, 1)).strip()
        if not raw_name:
            continue
        club_raw = str(sh.cell_value(r, 2)).strip()
        city_raw = str(sh.cell_value(r, 3)).strip()
        parts = re.split(r"[,.]|\s+(?=[A-ZÑÁÉÍÓÚ][a-zñáéíóú])", raw_name, maxsplit=1)
        last = parts[0].strip(" .,")
        first = parts[1].strip(" .,") if len(parts) > 1 else ""
        if not last:
            continue
        base_key = (norm_key(last), norm_key(first))
        club_key = norm_key(club_raw) + "|" + norm_key(city_raw)
        if club_key.strip("|") and club_key not in clubs:
            clubs[club_key] = (uid("club", club_key), title(club_raw), title(city_raw) or None)
        for col, sede in SEDE_COLS.items():
            try:
                val = sh.cell_value(r, col)
            except IndexError:
                continue
            if isinstance(val, (int, float)) and val > 0:
                raw_rows.append((last, first, base_key, club_key, club_raw, city_raw, cat, sede, int(val)))

# ---- pasada 2: decidir identidad. Si un (apellido,nombre) aparecio con
#      mas de un club distinto en todo el archivo, se separan en jugadores
#      distintos (uno por club); si no, es un unico jugador global.
#      La comparacion usa club_compare_key (laxa) para no separar por
#      simples variantes de tipeo ('Club Pelota' / 'Club de Pelota',
#      'Madryn' / 'Pto. Madryn'). ----
clubs_seen_by_base = defaultdict(set)
for _, _, base_key, club_key, club_raw, city_raw, *_ in raw_rows:
    if club_raw or city_raw:
        clubs_seen_by_base[base_key].add(club_compare_key(club_raw) + "|" + club_compare_key(city_raw))

def resolve_pkey(base_key, club_key):
    if len(clubs_seen_by_base.get(base_key, set())) > 1:
        return (base_key[0], base_key[1], club_key)  # identidad separada por club
    return (base_key[0], base_key[1], "")             # identidad global unica

players = {}       # pkey -> dict
ranking_rows = []  # (pkey, cat, sede, points)
club_conflicts = []

for last, first, base_key, club_key, club_raw, city_raw, cat, sede, points in raw_rows:
    ambiguous = len(clubs_seen_by_base.get(base_key, set())) > 1
    pkey = resolve_pkey(base_key, club_key)

    if pkey not in players:
        players[pkey] = {
            "id": uid("player", *pkey),
            "last": title(last),
            "first": title(first),
            "club_key": club_key if club_raw else None,
            "club_ambiguous": ambiguous,
        }
        if ambiguous:
            club_conflicts.append((f"{title(last)}, {title(first)}", club_raw or "(sin club)", cat, sede))

    ranking_rows.append((pkey, cat, sede, points))

n_ambiguous_people = len({pkey for pkey, p in players.items() if p["club_ambiguous"]})
print(f"clubes: {len(clubs)}  jugadores unicos: {len(players)}  eventos de ranking: {len(ranking_rows)}")
if club_conflicts:
    print(f"AVISO: {n_ambiguous_people} nombre(s) con club distinto segun la hoja -> "
          f"se cargaron como personas SEPARADAS, no fusionadas (revisar manualmente):")
    for name, club, cat, sede in club_conflicts:
        print(f"   - {name} [{cat}/{sede}] club: {club}")

# ------------------------------------------------------------
# generar seed.sql
# ------------------------------------------------------------
lines = []
w = lines.append

w("-- ============================================================")
w("-- SEED: ranking historico real 2025 (fuente: planilla del club)")
w("-- ============================================================")
w("-- Generado por db/generate_seed.py. Re-ejecutable: usa uuid5")
w("-- deterministicos + ON CONFLICT DO NOTHING, no duplica si se")
w("-- corre mas de una vez.")
w("-- Correr despues de 001_schema.sql, 002_rls.sql, 003_finalize_match.sql.")
w("-- ============================================================\n")

w(f"insert into seasons (id, year) values ({sql_str(season_id)}, {SEASON_YEAR})")
w("  on conflict (id) do nothing;\n")

w("-- categorias (orden: 50, 56, 61A, 61B, 65)")
for i, c in enumerate(cat_order):
    w(f"insert into categories (id, name, display_order) values "
      f"({sql_str(category_ids[c])}, {sql_str(c)}, {i})")
    w("  on conflict (id) do nothing;")
w("")

w("-- clubes (nombre normalizado desde la planilla; variantes de tipeo")
w("-- como 'Asoc. Espanola' / 'Asoc.Espanola' se agrupan en una sola fila)")
for cid, name, city in clubs.values():
    w(f"insert into clubs (id, name, city) values ({sql_str(cid)}, {sql_str(name)}, {sql_str(city)})")
    w("  on conflict (name, city) do nothing;")
w("")

w("-- torneos: un torneo por sede del circuito 2025 (datos historicos,")
w("-- cargados ya finalizados; no tienen fixture asociado)")
for sede, tid in tournament_ids.items():
    w(f"insert into tournaments (id, season_id, name, venue, city, status) values "
      f"({sql_str(tid)}, {sql_str(season_id)}, {sql_str('Torneo Patagonico de Veteranos ' + sede)}, "
      f"{sql_str(sede)}, {sql_str(sede)}, 'finished')")
    w("  on conflict (id) do nothing;")
w("")

w("-- jugadores (planilla real, 211 filas -> agrupadas por identidad).")
w("-- Identidad = (apellido, nombre) normalizados; si ese mismo nombre")
w("-- aparecio con clubes distintos en el archivo, se cargan como dos")
w("-- jugadores separados (ver AVISO mas abajo) en vez de fusionarlos.")
for pkey, p in players.items():
    display = (p["first"] + " " + p["last"]).strip()
    if p["club_key"] and p["club_key"] in clubs:
        club_sql = sql_str(clubs[p["club_key"]][0])
        city_sql = sql_str(clubs[p["club_key"]][2])
    else:
        club_sql, city_sql = "null", "null"
    if p["club_ambiguous"]:
        w(f"-- AVISO: {display} aparece con mas de un club/ciudad segun la hoja -> revisar si es la misma persona")
    w(f"insert into players (id, first_name, last_name, display_name, club_id, city) values "
      f"({sql_str(p['id'])}, {sql_str(p['first']) if p['first'] else 'null'}, {sql_str(p['last'])}, "
      f"{sql_str(display)}, {club_sql}, {city_sql})")
    w("  on conflict (id) do nothing;")
w("")

w("-- eventos de ranking: puntaje historico por (jugador, categoria, sede).")
w("-- event_type='historico_importado' porque el desglose por instancia")
w("-- (campeon/semifinal/...) no esta confirmado con el organizador todavia")
w("-- (ver pendiente #1 en docs/FASE-0-AUDITORIA.md). source_key garantiza")
w("-- que re-correr este seed no duplique puntos.")
for pkey, cat, sede, points in ranking_rows:
    pid = players[pkey]["id"]
    cat_id = category_ids[cat]
    tid = tournament_ids[sede]
    source_key = f"hist:{SEASON_YEAR}:{cat}:{sede}:{pkey[0]}:{pkey[1]}:{pkey[2]}"
    w(f"insert into ranking_events (player_id, season_id, category_id, tournament_id, "
      f"event_type, points, description, source_key) values "
      f"({sql_str(pid)}, {sql_str(season_id)}, {sql_str(cat_id)}, {sql_str(tid)}, "
      f"'historico_importado', {points}, {sql_str('Importado de planilla historica - ' + sede)}, "
      f"{sql_str(source_key)})")
    w("  on conflict (source_key) do nothing;")
w("")

OUT.write_text("\n".join(lines), encoding="utf-8")
print(f"\nescrito: {OUT}  ({len(lines)} lineas)")
