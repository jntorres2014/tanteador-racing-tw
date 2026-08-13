// ============================================================
// Edge Function: notify-match-queue
// ============================================================
// Esta es la funcion que manda los avisos SOLA, sin que nadie toque
// nada. Se dispara con un Database Webhook cada vez que se actualiza
// un partido (por ejemplo, al cargar un punto o al finalizarlo).
//
// Que hace, cada vez que se dispara:
//   1. Si el unico cambio fue "marcar como ya avisado" (ver mas abajo
//      por que pasa esto), no hace nada — evita una vuelta de mas.
//   2. Mira en que cancha y torneo esta el partido que cambio.
//   3. Recalcula la "cola" de esa cancha/torneo (que partidos estan
//      pendientes, en que orden, y cual esta jugandose ahora) usando
//      la vista court_queue que ya existe en la base.
//   4. Para el partido en juego / el que sigue / el que sigue despues
//      del que sigue, si todavia no se avisaron: los avisa.
//
// IMPORTANTE — por que "reserva" el aviso antes de mandarlo:
// mandar el push y RECIEN DESPUES marcar "ya avisado" es peligroso:
// si algo falla en el medio (una red lenta, un reintento automatico
// del propio sistema de webhooks), el marcador nunca queda guardado
// y el mismo aviso se puede terminar mandando varias veces. Por eso
// cada aviso primero intenta "reservarse" (poner el flag en true SOLO
// si todavia estaba en false) y unicamente si gana esa carrera, recien
// ahi manda el push. Así, pase lo que pase despues, no se puede
// repetir.
//
// No hace falta que nadie llame a esta funcion a mano — el Database
// Webhook la dispara sola. Solo sirve para pruebas manuales si hace
// falta debuggear.
// ============================================================

import { createClient } from "npm:@supabase/supabase-js@2";
import webpush from "npm:web-push@3.6.7";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const VAPID_PUBLIC_KEY = Deno.env.get("VAPID_PUBLIC_KEY")!;
const VAPID_PRIVATE_KEY = Deno.env.get("VAPID_PRIVATE_KEY")!;
// Opcional: si configurás un header personalizado "x-webhook-secret" en
// el Database Webhook con este mismo valor, la funcion lo valida antes
// de hacer nada. Si no configurás el secreto, este chequeo se saltea.
const WEBHOOK_SECRET = Deno.env.get("MATCH_WEBHOOK_SECRET") || "";

webpush.setVapidDetails("mailto:jntorres2014@gmail.com", VAPID_PUBLIC_KEY, VAPID_PRIVATE_KEY);

// Intenta "reservarse" un aviso: pone el flag en true SOLO si todavia
// estaba en false. Devuelve true si esta invocacion gano la carrera
// (es la unica que va a mandar ese aviso puntual).
async function claim(admin, matchId, flagColumn) {
  const { data, error } = await admin
    .from("matches")
    .update({ [flagColumn]: true })
    .eq("id", matchId)
    .eq(flagColumn, false)
    .select("id");
  if (error) throw error;
  return (data || []).length > 0;
}

async function sendToPair(admin, pairId, payload) {
  if (!pairId) return;
  const { data: subs } = await admin
    .from("push_subscriptions")
    .select("id, endpoint, p256dh, auth")
    .eq("pair_id", pairId);

  if (!subs || subs.length === 0) return;

  const body = JSON.stringify(payload);
  const deadIds = [];
  for (const sub of subs) {
    try {
      await webpush.sendNotification(
        { endpoint: sub.endpoint, keys: { p256dh: sub.p256dh, auth: sub.auth } },
        body
      );
    } catch (err) {
      const statusCode = err?.statusCode;
      if (statusCode === 404 || statusCode === 410) deadIds.push(sub.id);
    }
  }
  if (deadIds.length > 0) {
    await admin.from("push_subscriptions").delete().in("id", deadIds);
  }
}

function matchLabel(m) {
  return m.match_number ? `Partido ${m.match_number}` : "Tu partido";
}

// Nuestra propia funcion actualiza matches (para marcar los avisos
// como enviados), y eso dispara el webhook de nuevo. Si el UNICO
// cambio entre el antes y el despues son esos tres flags, no hace
// falta procesar nada — ya se proceso en la invocacion original.
function isOnlyNotifiedFlagsChanged(record, oldRecord) {
  if (!record || !oldRecord) return false;
  const ignore = new Set(["notified_started", "notified_1_before", "notified_2_before", "updated_at"]);
  const keys = new Set([...Object.keys(record), ...Object.keys(oldRecord)]);
  for (const key of keys) {
    if (ignore.has(key)) continue;
    if (record[key] !== oldRecord[key]) return false;
  }
  return true;
}

async function processMilestone(admin, m, flagColumn, title, bodyText) {
  const won = await claim(admin, m.id, flagColumn);
  if (!won) return false; // otra invocacion ya se encargo de este aviso
  try {
    await Promise.all([
      sendToPair(admin, m.pair_a_id, { title, body: bodyText, url: "torneos.html" }),
      sendToPair(admin, m.pair_b_id, { title, body: bodyText, url: "torneos.html" }),
    ]);
  } catch (err) {
    // El flag ya quedo reservado (no se va a repetir), pero dejamos
    // constancia del error para poder revisarlo en los logs.
    console.error(`error mandando aviso (${flagColumn}) para partido ${m.id}:`, err);
  }
  return true;
}

Deno.serve(async (req) => {
  try {
    if (WEBHOOK_SECRET) {
      const got = req.headers.get("x-webhook-secret") || "";
      if (got !== WEBHOOK_SECRET) {
        return new Response(JSON.stringify({ error: "secreto invalido" }), { status: 401 });
      }
    }

    const payload = await req.json().catch(() => ({}));
    const record = payload.record || payload.new || null;
    const oldRecord = payload.old_record || payload.old || null;
    const courtId = record?.court_id;
    const tournamentId = record?.tournament_id;

    if (!courtId || !tournamentId) {
      return new Response(JSON.stringify({ skipped: "sin cancha o sin torneo" }), { status: 200 });
    }

    if (isOnlyNotifiedFlagsChanged(record, oldRecord)) {
      return new Response(JSON.stringify({ skipped: "solo cambiaron los flags de aviso" }), { status: 200 });
    }

    const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

    // Importante: la cola es la de ESTE torneo en ESTA cancha. Si la
    // misma cancha tiene partidos de otro torneo mezclados, no deben
    // contar para esta cola (por eso se filtra por los dos).
    const { data: queue, error } = await admin
      .from("court_queue")
      .select("*")
      .eq("court_id", courtId)
      .eq("tournament_id", tournamentId);

    if (error) {
      return new Response(JSON.stringify({ error: error.message }), { status: 500 });
    }

    const results = { started: false, oneBefore: false, twoBefore: false };

    const playing = (queue || []).find((m) => m.computed_status === "playing" && !m.notified_started);
    if (playing) {
      results.started = await processMilestone(
        admin, playing, "notified_started",
        "¡Arrancó tu partido!",
        `${matchLabel(playing)} está arrancando ahora en tu cancha.`
      );
    }

    const oneBefore = (queue || []).find((m) => m.position_in_queue === 1 && !m.notified_1_before);
    if (oneBefore) {
      results.oneBefore = await processMilestone(
        admin, oneBefore, "notified_1_before",
        "Falta 1 partido para el tuyo",
        `${matchLabel(oneBefore)} es el próximo en tu cancha.`
      );
    }

    const twoBefore = (queue || []).find((m) => m.position_in_queue === 2 && !m.notified_2_before);
    if (twoBefore) {
      results.twoBefore = await processMilestone(
        admin, twoBefore, "notified_2_before",
        "Faltan 2 partidos para el tuyo",
        `${matchLabel(twoBefore)} va a jugarse dentro de 2 partidos en tu cancha.`
      );
    }

    return new Response(JSON.stringify(results), { status: 200 });
  } catch (err) {
    return new Response(JSON.stringify({ error: String(err) }), { status: 500 });
  }
});
