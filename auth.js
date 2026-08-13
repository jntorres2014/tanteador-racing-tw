// ============================================================
// auth.js — login con Google (Supabase Auth), reusable en varias
// paginas del sitio (index.html, torneos.html, etc).
// ============================================================
// Requiere que la variable "client" (supabase-js) ya este creada
// ANTES de incluir este script, y que exista un elemento en la
// pagina donde renderizar la barra (ver authRenderInto).
//
// Que hace y que NO hace (todavia):
// - Muestra si hay sesion iniciada, con que cuenta, y si esa cuenta
//   ya fue activada por un admin.
// - Deja iniciar sesion con Google y cerrar sesion.
// - NO bloquea ninguna accion todavia (eso es un paso aparte: hay
//   que endurecer los permisos en la base de datos primero, sino
//   alguien podria seguir escribiendo directo sin pasar por esta
//   pantalla). Por ahora es solo la puerta de entrada.
// ============================================================

function authEscapeHtml(s) {
  return String(s || "").replace(/[&<>"']/g, (c) => ({ "&":"&amp;", "<":"&lt;", ">":"&gt;", '"':"&quot;", "'":"&#39;" }[c]));
}

async function authGetProfile() {
  const { data: sessionData } = await client.auth.getSession();
  const session = sessionData ? sessionData.session : null;
  if (!session) return { session: null, profile: null };
  const { data: profile } = await client
    .from("profiles")
    .select("*")
    .eq("id", session.user.id)
    .single();
  return { session, profile };
}

async function authLogin() {
  const redirectTo = window.location.origin + window.location.pathname;
  await client.auth.signInWithOAuth({
    provider: "google",
    options: { redirectTo },
  });
}

async function authLogout() {
  await client.auth.signOut();
  window.location.reload();
}

function authBarHtml(session, profile) {
  if (!session) {
    return `
      <div class="auth-bar auth-bar-out">
        <button class="auth-btn-google" onclick="authLogin()">
          <span class="auth-google-g">G</span> Ingresar con Google
        </button>
      </div>`;
  }

  const name = authEscapeHtml((profile && profile.full_name) || session.user.email);
  const avatar = profile && profile.avatar_url ? authEscapeHtml(profile.avatar_url) : "";

  let badge;
  if (!profile || !profile.active) {
    badge = `<div class="auth-pending">Cuenta pendiente de activación</div>`;
  } else if (profile.role === "admin") {
    badge = `<div class="auth-role auth-role-admin">Administrador</div>`;
  } else {
    badge = `<div class="auth-role">Árbitro</div>`;
  }

  return `
    <div class="auth-bar auth-bar-in">
      <div class="auth-user">
        ${avatar ? `<img src="${avatar}" class="auth-avatar" alt="" />` : `<div class="auth-avatar auth-avatar-fallback">${name.charAt(0).toUpperCase()}</div>`}
        <div class="auth-user-text">
          <div class="auth-name">${name}</div>
          ${badge}
        </div>
      </div>
      <button class="auth-btn-logout" onclick="authLogout()">Salir</button>
    </div>
  `;
}

// Renderiza la barra de login/usuario dentro del elemento con ese id.
// Devuelve { session, profile } por si la pagina que llama necesita
// saber el estado (por ejemplo, para mostrar u ocultar botones).
async function authRenderInto(elId) {
  const el = document.getElementById(elId);
  if (!el) return { session: null, profile: null };
  const result = await authGetProfile();
  el.innerHTML = authBarHtml(result.session, result.profile);
  return result;
}

// Vuelve a dibujar la barra automaticamente cuando cambia el estado
// de sesion (por ejemplo, al volver de loguearse con Google).
function authWatch(elId, onChange) {
  client.auth.onAuthStateChange(async (_event, _session) => {
    const result = await authRenderInto(elId);
    if (onChange) onChange(result);
  });
}
