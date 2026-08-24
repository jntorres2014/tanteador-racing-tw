// ============================================================
// CONFIGURACION DE SUPABASE - TANTEADOR RACING CLUB TW
// ============================================================
// Pegar aca los datos del proyecto de Supabase.
// Se consiguen en: Supabase Dashboard -> Settings -> API
//   - Project URL          -> SUPABASE_URL
//   - Project API keys -> "anon" "public" -> SUPABASE_ANON_KEY
//
// Es el UNICO archivo que hay que editar para conectar todo.
// ============================================================

const SUPABASE_URL_NUBE = "https://qipsmmbhmurtpndvmwar.supabase.co";
const SUPABASE_ANON_KEY_NUBE = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFpcHNtbWJobXVydHBuZHZtd2FyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODYxMzQzOTYsImV4cCI6MjEwMTcxMDM5Nn0.2JGACCDIFPRb8VSqJe8ss9ALImjYOZFzpQ1x7b3PTAM";

// ============================================================
// MODO LOCAL (sin internet) — ver MODO-LOCAL.md para la guia
// completa de como levantar todo esto en una notebook para usar
// en el club sin conexion.
// ============================================================
// Resumen: alguien corre "supabase start" en la notebook, y con la
// URL y la anon key que eso le imprime en pantalla, entra UNA VEZ a
// servidor.html y las carga ahi. Eso queda guardado en el navegador
// de esa notebook/celular (localStorage) — no hace falta tocar este
// archivo para nada, y mientras nadie haga ese paso, TODO sigue
// funcionando exactamente igual que siempre, contra la nube.
// ============================================================
function leerConfigServidorLocal() {
  try {
    const raw = localStorage.getItem("configServidor");
    if (!raw) return null;
    const cfg = JSON.parse(raw);
    if (cfg && cfg.modo === "local" && cfg.url && cfg.anonKey) return cfg;
  } catch (e) {
    // localStorage corrupto/inaccesible: seguimos con la nube, sin romper nada.
  }
  return null;
}

const CONFIG_SERVIDOR_LOCAL = leerConfigServidorLocal();
const MODO_SERVIDOR = CONFIG_SERVIDOR_LOCAL ? "local" : "nube";
const SUPABASE_URL = CONFIG_SERVIDOR_LOCAL ? CONFIG_SERVIDOR_LOCAL.url : SUPABASE_URL_NUBE;
const SUPABASE_ANON_KEY = CONFIG_SERVIDOR_LOCAL ? CONFIG_SERVIDOR_LOCAL.anonKey : SUPABASE_ANON_KEY_NUBE;

// Cartelito fijo arriba de la pagina cuando se esta en modo local, para
// que nadie se confunda por que no le llegan avisos push o por que
// "En vivo (publico)" no muestra nada afuera del club ese dia.
if (MODO_SERVIDOR === "local" && typeof document !== "undefined") {
  document.addEventListener("DOMContentLoaded", function () {
    const bar = document.createElement("div");
    bar.textContent = "🔌 Modo local (sin internet) — servidor.html para volver a la nube";
    bar.style.cssText =
      "background:#ff9d4b;color:#0b1320;font-weight:700;font-size:0.78rem;" +
      "text-align:center;padding:7px 10px;position:sticky;top:0;z-index:999;";
    document.body.insertBefore(bar, document.body.firstChild);
  });
}

// PIN de 4 digitos para habilitar los botones de control.
// Cambialo por el que quieras antes de la primera vez que lo usen.
const CONTROL_PIN = "1990";
