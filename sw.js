// ============================================================
// Service worker — hace falta para que el navegador pueda recibir
// notificaciones push, aunque la pagina no este abierta.
// ============================================================
// Paso 1 (hoy): solo se registra, para que el navegador pueda crear
// la "suscripcion" cuando alguien toca "Avisarme".
// Paso 2 (proximo): cuando el servidor mande un push de verdad, el
// codigo de aca abajo ("push" y "notificationclick") ya esta listo
// para mostrarlo y para llevar a la persona al partido correspondiente
// al tocarlo — no hace falta tocar este archivo de nuevo.
// ============================================================

self.addEventListener("install", (event) => {
  self.skipWaiting();
});

self.addEventListener("activate", (event) => {
  event.waitUntil(self.clients.claim());
});

self.addEventListener("push", (event) => {
  let payload = { title: "Racing Club TW", body: "Tenés una novedad en el tanteador.", url: "index.html" };
  if (event.data) {
    try { payload = { ...payload, ...event.data.json() }; } catch (e) { /* mensaje no era JSON, usamos el default */ }
  }
  event.waitUntil(
    self.registration.showNotification(payload.title, {
      body: payload.body,
      icon: "logo.png",
      badge: "logo.png",
      data: { url: payload.url || "index.html" },
    })
  );
});

self.addEventListener("notificationclick", (event) => {
  event.notification.close();
  const url = (event.notification.data && event.notification.data.url) || "index.html";
  event.waitUntil(
    clients.matchAll({ type: "window" }).then((windowClients) => {
      for (const client of windowClients) {
        if (client.url.includes(url) && "focus" in client) return client.focus();
      }
      if (clients.openWindow) return clients.openWindow(url);
    })
  );
});
