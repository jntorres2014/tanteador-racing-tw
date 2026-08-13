// ============================================================
// LOGICA DE IMPORTACION DE FIXTURE — sin DOM, sin Supabase.
// ============================================================
// Se prueba aparte (ver test/test-importar.mjs) y la usa
// importar-fixture.html en el navegador. Separarla asi permite
// verificar el parseo contra datos reales sin necesitar un
// navegador ni una base de datos.
//
// Flujo que implementa (prompt maestro §13):
//   leer -> normalizar -> detectar problemas -> [el humano revisa] -> importar
//
// Reglas de parseo de nombres, sacadas de datos reales (no inventadas):
//   - separador mas comun: guion ("Ferre-Santos")
//   - a veces es espacio ("Larrañaga Jeckel")
//   - un apellido puede tener espacio ADENTRO ("Galvan-De Uriarte":
//     el guion separa los dos apellidos, "De Uriarte" es UNO solo)
//   - referencias a partidos futuros: "Ganador Partido N" / "Perdedor Partido N"
//   - nunca se debe fusionar una ambiguedad de persona sola: se marca
//     y se deja que el humano decida.
// ============================================================

(function (root, factory) {
  if (typeof module === "object" && module.exports) {
    module.exports = factory();
  } else {
    root.ImportarLogic = factory();
  }
})(typeof self !== "undefined" ? self : this, function () {

  function normalizeKey(s) {
    return (s || "")
      .normalize("NFKD")
      .replace(/[̀-ͯ]/g, "") // saca acentos
      .toUpperCase()
      .replace(/\s+/g, " ")
      .trim();
  }

  function titleCase(s) {
    return (s || "").trim().split(/\s+/).map(w =>
      w.length ? w[0].toUpperCase() + w.slice(1).toLowerCase() : w
    ).join(" ");
  }

  // Distancia de edicion simple, para sugerir "seguro quisiste decir X"
  // cuando un apellido no matchea con nada del roster (Levenshtein).
  function editDistance(a, b) {
    a = normalizeKey(a); b = normalizeKey(b);
    const dp = Array.from({ length: a.length + 1 }, (_, i) => [i, ...Array(b.length).fill(0)]);
    for (let j = 0; j <= b.length; j++) dp[0][j] = j;
    for (let i = 1; i <= a.length; i++) {
      for (let j = 1; j <= b.length; j++) {
        dp[i][j] = a[i - 1] === b[j - 1]
          ? dp[i - 1][j - 1]
          : 1 + Math.min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]);
      }
    }
    return dp[a.length][b.length];
  }

  // ------------------------------------------------------------
  // Parseo de una celda de pareja: "Ferre-Santos", "Larrañaga Jeckel",
  // "Galvan-De Uriarte", "Ganador Partido 1", "Ganador Partido 1 "...
  // ------------------------------------------------------------
  const REF_RE = /^(Ganador|Perdedor)\s+Partido\s+(\d+)\s*$/i;

  function parsePairCell(raw) {
    const text = (raw || "").toString().trim();
    if (!text) return { raw: text, isEmpty: true };

    const refMatch = text.match(REF_RE);
    if (refMatch) {
      return {
        raw: text,
        isReference: true,
        refType: refMatch[1].toLowerCase() === "ganador" ? "winner_of" : "loser_of",
        refMatchNumber: parseInt(refMatch[2], 10),
      };
    }

    let apellidos;
    let separator;
    if (text.includes("-")) {
      // split en el PRIMER guion nada mas: preserva apellidos
      // compuestos como "De Uriarte" que vienen despues del guion.
      const idx = text.indexOf("-");
      apellidos = [text.slice(0, idx).trim(), text.slice(idx + 1).trim()];
      separator = "-";
    } else {
      const parts = text.split(/\s+/);
      if (parts.length === 2) {
        apellidos = parts;
        separator = " ";
      } else {
        // no se puede separar con confianza (0, 1 o 3+ palabras):
        // se deja para revision manual, NUNCA se inventa un corte.
        return { raw: text, isReference: false, unresolved: true, apellidos: [text] };
      }
    }

    return {
      raw: text,
      isReference: false,
      unresolved: false,
      apellidos: apellidos.map(a => a.trim()).filter(Boolean),
      separator,
    };
  }

  // ------------------------------------------------------------
  // Matchear un apellido contra el roster existente (jugadores ya
  // cargados), filtrando por categoria para desambiguar (esto solo,
  // sacado de datos reales, resuelve ~72% de los casos). Nunca
  // fusiona un empate: lo deja "ambiguous" para que decida un humano.
  // roster: [{ id, lastName, firstName, categoryName, clubName }]
  // ------------------------------------------------------------
  function matchPlayer(apellidoRaw, categoryName, roster) {
    const key = normalizeKey(apellidoRaw);
    const sameCategory = roster.filter(p => normalizeKey(p.categoryName) === normalizeKey(categoryName));
    const exact = sameCategory.filter(p => normalizeKey(p.lastName) === key);

    if (exact.length === 1) {
      return { status: "matched", player: exact[0] };
    }
    if (exact.length > 1) {
      return { status: "ambiguous", candidates: exact };
    }

    // no matchea en esa categoria: buscar en TODO el roster por si es
    // un simple error de tipeo (distancia de edicion chica)
    const suggestions = roster
      .map(p => ({ player: p, dist: editDistance(apellidoRaw, p.lastName) }))
      .filter(s => s.dist > 0 && s.dist <= 2)
      .sort((a, b) => a.dist - b.dist)
      .slice(0, 3)
      .map(s => s.player);

    if (suggestions.length) {
      return { status: "not_found_with_suggestion", suggestions };
    }
    return { status: "not_found" };
  }

  // ------------------------------------------------------------
  // Construye el plan de importacion completo a partir de filas ya
  // mapeadas a columnas (nro, hora, categoria, ladoA, ladoB, cancha).
  // No escribe nada: devuelve un objeto para previsualizar y, recien
  // si el humano confirma, se usa para generar los inserts.
  // ------------------------------------------------------------
  function buildImportPlan(rows, roster) {
    const matches = [];
    const warnings = [];

    rows.forEach((row, idx) => {
      const a = parsePairCell(row.ladoA);
      const b = parsePairCell(row.ladoB);
      const matchNumber = row.nro != null ? parseInt(row.nro, 10) : idx + 1;

      const resolveSide = (side, label) => {
        if (side.isEmpty) {
          warnings.push({ type: "lado_vacio", matchNumber, detail: `Partido ${matchNumber}: falta ${label}` });
          return { kind: "empty" };
        }
        if (side.isReference) {
          return { kind: "reference", refType: side.refType, refMatchNumber: side.refMatchNumber, raw: side.raw };
        }
        if (side.unresolved) {
          warnings.push({
            type: "nombre_no_separable", matchNumber,
            detail: `Partido ${matchNumber} (${label}): "${side.raw}" no se pudo separar en dos apellidos, requiere revision manual`,
          });
          return { kind: "unresolved", raw: side.raw };
        }
        const resolved = side.apellidos.map(ap => {
          const m = matchPlayer(ap, row.categoria, roster);
          if (m.status === "ambiguous") {
            warnings.push({
              type: "jugador_ambiguo", matchNumber,
              detail: `Partido ${matchNumber} (${label}): "${ap}" coincide con ${m.candidates.length} jugadores de la categoria ${row.categoria} (${m.candidates.map(c => c.firstName + " " + c.lastName).join(", ")}). No se elige solo, hay que confirmar cual es.`,
            });
          } else if (m.status === "not_found_with_suggestion") {
            warnings.push({
              type: "posible_error_tipeo", matchNumber,
              detail: `Partido ${matchNumber} (${label}): "${ap}" no esta en el padron. ¿Es "${m.suggestions[0].lastName}"?`,
            });
          } else if (m.status === "not_found") {
            warnings.push({
              type: "jugador_nuevo", matchNumber,
              detail: `Partido ${matchNumber} (${label}): "${ap}" no esta en el padron. Se puede dar de alta como jugador nuevo.`,
            });
          }
          return { apellidoRaw: ap, match: m };
        });
        return { kind: "pair", raw: side.raw, apellidos: resolved };
      };

      matches.push({
        matchNumber,
        hora: row.hora || null,
        categoria: row.categoria,
        cancha: row.cancha || null,
        sequenceOrder: idx + 1,
        sideA: resolveSide(a, "pareja A"),
        sideB: resolveSide(b, "pareja B"),
      });
    });

    // Resolver referencias "Ganador/Perdedor Partido N" contra el
    // propio numero de partido dentro de este mismo import.
    const byNumber = new Map(matches.map(m => [m.matchNumber, m]));
    matches.forEach(m => {
      [["sideA", m.sideA], ["sideB", m.sideB]].forEach(([key, side]) => {
        if (side.kind === "reference") {
          const source = byNumber.get(side.refMatchNumber);
          if (!source) {
            warnings.push({
              type: "referencia_invalida", matchNumber: m.matchNumber,
              detail: `Partido ${m.matchNumber}: hace referencia a "Partido ${side.refMatchNumber}", que no existe en este fixture.`,
            });
          } else if (source.matchNumber === m.matchNumber) {
            warnings.push({
              type: "referencia_circular", matchNumber: m.matchNumber,
              detail: `Partido ${m.matchNumber}: se referencia a si mismo.`,
            });
          }
        }
      });
    });

    // Deteccion de anomalia real encontrada en datos reales: la MISMA
    // pareja de apellidos (sin importar orden) aparece en dos
    // categorias distintas el mismo dia -> probable error de tipeo de
    // categoria (paso con los partidos 14/15 del 27/09, cargados como
    // 61A cuando eran continuacion de la zona de 56).
    const pairSignature = (side) => {
      if (side.kind !== "pair") return null;
      const aps = side.apellidos.map(a => normalizeKey(a.apellidoRaw)).sort();
      return aps.join("|");
    };
    const seenBySignature = new Map(); // signature -> [{matchNumber, categoria}]
    matches.forEach(m => {
      [m.sideA, m.sideB].forEach(side => {
        const sig = pairSignature(side);
        if (!sig) return;
        if (!seenBySignature.has(sig)) seenBySignature.set(sig, []);
        seenBySignature.get(sig).push({ matchNumber: m.matchNumber, categoria: m.categoria });
      });
    });
    for (const [sig, occurrences] of seenBySignature.entries()) {
      const categorias = new Set(occurrences.map(o => normalizeKey(o.categoria)));
      if (categorias.size > 1) {
        warnings.push({
          type: "categoria_inconsistente",
          matchNumber: occurrences[occurrences.length - 1].matchNumber,
          detail: `La pareja "${sig.replace("|", " / ")}" aparece con categorias distintas en el mismo fixture (partidos ${occurrences.map(o => o.matchNumber + ":" + o.categoria).join(", ")}). Revisar cual es la correcta.`,
        });
      }
    }

    const summary = {
      totalMatches: matches.length,
      categorias: [...new Set(matches.map(m => normalizeKey(m.categoria)))],
      canchas: [...new Set(matches.map(m => m.cancha).filter(Boolean))],
      warnings: warnings.length,
    };

    return { matches, warnings, summary };
  }

  return { normalizeKey, titleCase, editDistance, parsePairCell, matchPlayer, buildImportPlan };
});
