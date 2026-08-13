// ============================================================
// Edge Function: notify-match-queue
// ============================================================
// Esta es la funcion que manda los avisos SOLA, sin que nadie toque
// nada. Se dispara con un Database Webhook cada vez que se actualiza
// un partido (por ejemplo, al marcarlo EN VIVO o al finalizarlo).
//
// Que hace, cada vez que se dispara:
//   1. Mira en que cancha esta el partido que cambio.
//   2. Recalcula la "cola" de esa cancha (que partidos estan
//      pendientes, en que orden, y cual esta jugandose ahora) usando
//      la vista court_queue que ya existe en la base.
//   3. Para el partido que esta jugandose ahora (si recien arranco):
//      avisa "arranca ahora" a los suscriptos de sus dos parejas.
//   4. Para el partido que quedo primero en la cola (el que sigue):
//      avisa "falta 1 partido" a sus suscriptos.
//   5. Para el partido que quedo segundo en la cola:
//      avisa "faltan 2 partidos" a sus suscriptos.
//   6. Marca cada aviso como "ya mandado" (notified_2_before,
//      notified_1_before, notified_started) para no repetirlo la
//      proxima vez que se recalcule la cola de esa misma cancha.
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
    const courtId = record?.court_id;
    const tournamentId = record?.tournament_id;

    if (!courtId || !tournamentId) {
      return new Response(JSON.stringify({ skipped: "sin cancha o sin torneo" }), { status: 200 });
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

    const results = { started: 0, oneBefore: 0, twoBefore: 0 };

    // Partido jugandose ahora en esta cancha, todavia no avisado.
    const playing = (queue || []).find((m) => m.computed_status === "playing" && !m.notified_started);
    if (playing) {
      await Promise.all([
        sendToPair(admin, playing.pair_a_id, {
          title: "¡Arrancó tu partido!",
          body: `${matchLabel(playing)} está arrancando ahora en tu cancha.`,
          url: "torneos.html",
        }),
        sendToPair(admin, playing.pair_b_id, {
          title: "¡Arrancó tu partido!",
          body: `${matchLabel(playing)} está arrancando ahora en tu cancha.`,
          url: "torneos.html",
        }),
      ]);
      await admin.from("matches").update({ notified_started: true }).eq("id", playing.id);
      results.started = 1;
    }

    // Primero y segundo en la cola de pendientes de esta cancha.
    const oneBefore = (queue || []).find((m) => m.position_in_queue === 1 && !m.notified_1_before);
    if (oneBefore) {
      await Promise.all([
        sendToPair(admin, oneBefore.pair_a_id, {
          title: "Falta 1 partido para el tuyo",
          body: `${matchLabel(oneBefore)} es el próximo en tu cancha.`,
          url: "torneos.html",
        }),
        sendToPair(admin, oneBefore.pair_b_id, {
          title: "Falta 1 partido para el tuyo",
          body: `${matchLabel(oneBefore)} es el próximo en tu cancha.`,
          url: "torneos.html",
        }),
      ]);
      await admin.from("matches").update({ notified_1_before: true }).eq("id", oneBefore.id);
      results.oneBefore = 1;
    }

    const twoBefore = (queue || []).find((m) => m.position_in_queue === 2 && !m.notified_2_before);
    if (twoBefore) {
      await Promise.all([
        sendToPair(admin, twoBefore.pair_a_id, {
          title: "Faltan 2 partidos para el tuyo",
          body: `${matchLabel(twoBefore)} va a jugarse dentro de 2 partidos en tu cancha.`,
          url: "torneos.html",
        }),
        sendToPair(admin, twoBefore.pair_b_id, {
          title: "Faltan 2 partidos para el tuyo",
          body: `${matchLabel(twoBefore)} va a jugarse dentro de 2 partidos en tu cancha.`,
          url: "torneos.html",
        }),
      ]);
      await admin.from("matches").update({ notified_2_before: true }).eq("id", twoBefore.id);
      results.twoBefore = 1;
    }

    return new Response(JSON.stringify(results), { status: 200 });
  } catch (err) {
    return new Response(JSON.stringify({ error: String(err) }), { status: 500 });
  }
});
