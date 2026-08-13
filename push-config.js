// ============================================================
// Clave publica VAPID para las notificaciones push.
// ============================================================
// Esta clave es PUBLICA a proposito (a diferencia de la clave
// anonima de Supabase, esta no protege nada por si sola: sirve para
// que el navegador sepa "quien" va a mandar los avisos, no para dar
// permiso de nada). La clave PRIVADA correspondiente no esta en este
// archivo ni en el repositorio — se usa recien en el proximo paso
// (la funcion que efectivamente manda los avisos) y se guarda aparte,
// como secreto de Supabase.
// ============================================================
const VAPID_PUBLIC_KEY = "BErwLQJ-oX7ODBJdDdt8zmy-AFohvPMn3b0mO-KOX5b7aLTXzSjXUd6TzsVfbV3j0L73e97s5ZIkphys50U3Puk";
