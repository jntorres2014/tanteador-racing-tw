// ============================================================
// Edge Function: send-test-push
// ============================================================
// Que hace: manda una notificacion push de PRUEBA a las suscripciones
// guardadas en push_subscriptions. Sirve para confirmar que toda la
// "fontaneria" (claves VAPID, service worker, navegador) funciona
// antes de conectar la logica automatica de "2 partidos antes / 1
// antes / ahora".
//
// Quien la puede llamar: solo un usuario logueado, activo, y con rol
// admin. Se valida el token que manda el navegador contra la tabla
// profiles usando la service role key (que salta las RLS).
//
// Como se prueba (desde el panel de Supabase, boton "Test"):
//   Headers -> Authorization: Bearer <tu access token de sesion>
//   Body (JSON), cualquiera de las dos formas:
//     {}                          -> le manda la prueba a TODAS las suscripciones
//     { "pair_id": "uuid-de-la-pareja" } -> le manda solo a esa pareja
//
// Que hace con las suscripciones "muertas": si el navegador de la
// persona ya no existe mas (respuesta 404 o 410 del servicio de
// push), borra esa fila de push_subscriptions para no seguir
// intentando en vano.
// ============================================================

import { createClient } from "npm:@supabase/supabase-js@2";
import webpush from "npm:web-push@3.6.7";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const VAPID_PUBLIC_KEY = Deno.env.get("VAPID_PUBLIC_KEY")!;
const VAPID_PRIVATE_KEY = Deno.env.get("VAPID_PRIVATE_KEY")!;

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const authHeader = req.headers.get("Authorization") ?? "";
    const token = authHeader.replace("Bearer ", "");
    if (!token) {
      return new Response(JSON.stringify({ error: "Falta el token de sesion (Authorization header)." }), {
        status: 401,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    // Cliente con service role: puede leer/escribir sin las RLS, pero
    // lo usamos primero solo para validar QUIEN esta llamando.
    const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

    const { data: userData, error: userError } = await admin.auth.getUser(token);
    if (userError || !userData?.user) {
      return new Response(JSON.stringify({ error: "Sesion invalida." }), {
        status: 401,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const { data: profile, error: profileError } = await admin
      .from("profiles")
      .select("role, active")
      .eq("id", userData.user.id)
      .single();

    if (profileError || !profile || profile.role !== "admin" || !profile.active) {
      return new Response(JSON.stringify({ error: "Solo un admin activo puede mandar una notificacion de prueba." }), {
        status: 403,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    // A quien le mandamos la prueba.
    let body: { pair_id?: string } = {};
    try {
      body = await req.json();
    } catch (_e) {
      // sin body -> le mandamos a todas las suscripciones
    }

    let query = admin.from("push_subscriptions").select("id, endpoint, p256dh, auth, pair_id");
    if (body.pair_id) query = query.eq("pair_id", body.pair_id);
    const { data: subs, error: subsError } = await query;

    if (subsError) {
      return new Response(JSON.stringify({ error: subsError.message }), {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    if (!subs || subs.length === 0) {
      return new Response(JSON.stringify({ sent: 0, failed: 0, deleted: 0, message: "No hay suscripciones para avisar." }), {
        status: 200,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    webpush.setVapidDetails("mailto:jntorres2014@gmail.com", VAPID_PUBLIC_KEY, VAPID_PRIVATE_KEY);

    const payload = JSON.stringify({
      title: "Racing Club TW — Prueba",
      body: "Si ves esto, las notificaciones push ya funcionan de punta a punta.",
      url: "index.html",
    });

    let sent = 0;
    let failed = 0;
    const deadIds: string[] = [];

    for (const sub of subs) {
      try {
        await webpush.sendNotification(
          {
            endpoint: sub.endpoint,
            keys: { p256dh: sub.p256dh, auth: sub.auth },
          },
          payload
        );
        sent++;
      } catch (err) {
        failed++;
        const statusCode = err?.statusCode;
        if (statusCode === 404 || statusCode === 410) {
          deadIds.push(sub.id);
        }
      }
    }

    if (deadIds.length > 0) {
      await admin.from("push_subscriptions").delete().in("id", deadIds);
    }

    return new Response(
      JSON.stringify({ sent, failed, deleted: deadIds.length }),
      { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (err) {
    return new Response(JSON.stringify({ error: String(err) }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});
