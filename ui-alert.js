// ============================================================
// ui-alert.js — reemplazo de alert()/confirm()/prompt() nativos
// del navegador por cuadros con el estilo del sitio (fondo oscuro,
// tarjeta redondeada, mismos colores que el resto de las pantallas).
//
// Uso:
//   await showAlert("mensaje");
//   await showAlert("mensaje", { type: "error" });         // info | success | error | warn
//   const ok = await showConfirm("¿Seguro?");                // true | false
//   const val = await showPrompt("Escribí el nombre", { defaultValue: "" }); // string | null
//
// Se puede incluir en cualquier página con:
//   <script src="ui-alert.js"></script>
// No depende de nada del resto del sitio (estilos propios, con
// prefijo "uialert-" para no chocar con clases existentes).
// ============================================================
(function () {
  const STYLE_ID = "uialert-style";

  function ensureStyle() {
    if (document.getElementById(STYLE_ID)) return;
    const style = document.createElement("style");
    style.id = STYLE_ID;
    style.textContent = `
      .uialert-overlay {
        position: fixed; inset: 0; z-index: 99999;
        background: rgba(5,8,15,0.72); backdrop-filter: blur(2px);
        display: flex; align-items: center; justify-content: center;
        padding: 20px; opacity: 0; transition: opacity .15s ease;
        font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      }
      .uialert-overlay.show { opacity: 1; }
      .uialert-box {
        background: #1b2433; border: 2px solid #3a4256; border-radius: 16px;
        padding: 22px 22px 18px; max-width: 380px; width: 100%;
        box-shadow: 0 20px 60px rgba(0,0,0,0.5);
        transform: translateY(8px) scale(0.98); transition: transform .15s ease;
      }
      .uialert-overlay.show .uialert-box { transform: translateY(0) scale(1); }
      .uialert-icon {
        width: 40px; height: 40px; border-radius: 50%;
        display: flex; align-items: center; justify-content: center;
        font-size: 1.2rem; font-weight: 700; margin-bottom: 12px;
      }
      .uialert-icon.info    { background: rgba(63,169,245,0.15); color: #3fa9f5; }
      .uialert-icon.success { background: rgba(63,217,118,0.15); color: #3fd976; }
      .uialert-icon.error   { background: rgba(255,75,75,0.15);  color: #ff4b4b; }
      .uialert-icon.warn    { background: rgba(255,157,75,0.15); color: #ff9d4b; }
      .uialert-title { font-weight: 700; font-size: 1rem; color: #fff; margin-bottom: 6px; }
      .uialert-msg {
        color: #bcc4d1; font-size: 0.87rem; line-height: 1.45;
        white-space: pre-wrap; margin-bottom: 18px;
      }
      .uialert-input {
        width: 100%; padding: 10px 12px; border-radius: 8px;
        border: 1px solid #3a4256; background: #111827; color: #fff;
        font-size: 0.88rem; margin-bottom: 6px; box-sizing: border-box;
        font-family: inherit;
      }
      .uialert-input:focus { outline: none; border-color: #3fa9f5; }
      .uialert-err { color: #ff4b4b; font-size: 0.76rem; min-height: 1.1em; margin-bottom: 12px; }
      .uialert-btns { display: flex; gap: 10px; justify-content: flex-end; margin-top: 4px; }
      .uialert-btn {
        border: none; border-radius: 8px; padding: 9px 16px;
        font-weight: 600; font-size: 0.85rem; cursor: pointer;
        font-family: inherit;
      }
      .uialert-btn.primary { background: #3fa9f5; color: #fff; }
      .uialert-btn.danger  { background: #ff4b4b; color: #fff; }
      .uialert-btn.ghost   { background: #3a4256; color: #fff; }
      .uialert-btn:disabled { opacity: 0.6; cursor: not-allowed; }
    `;
    document.head.appendChild(style);
  }

  function escapeHtml(s) {
    return String(s == null ? "" : s).replace(/[&<>"']/g, (c) => ({
      "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;",
    }[c]));
  }

  const ICONS = { info: "i", success: "✓", error: "!", warn: "!" };
  const DEFAULT_TITLES = { info: "Aviso", success: "Listo", error: "Error", warn: "Atención" };

  function openOverlay(innerHtml) {
    ensureStyle();
    const overlay = document.createElement("div");
    overlay.className = "uialert-overlay";
    overlay.innerHTML = innerHtml;
    document.body.appendChild(overlay);
    requestAnimationFrame(() => overlay.classList.add("show"));
    return overlay;
  }

  function closeOverlay(overlay, cb) {
    overlay.classList.remove("show");
    setTimeout(() => {
      overlay.remove();
      if (cb) cb();
    }, 150);
  }

  window.showAlert = function (message, opts) {
    opts = opts || {};
    const type = opts.type || "info";
    const title = opts.title || DEFAULT_TITLES[type] || DEFAULT_TITLES.info;
    const okLabel = opts.okLabel || "Entendido";
    return new Promise((resolve) => {
      const overlay = openOverlay(`
        <div class="uialert-box">
          <div class="uialert-icon ${type}">${ICONS[type] || ICONS.info}</div>
          <div class="uialert-title">${escapeHtml(title)}</div>
          <div class="uialert-msg">${escapeHtml(message)}</div>
          <div class="uialert-btns">
            <button class="uialert-btn primary" data-act="ok">${escapeHtml(okLabel)}</button>
          </div>
        </div>
      `);
      const okBtn = overlay.querySelector('[data-act="ok"]');
      function finish() {
        document.removeEventListener("keydown", onKey);
        closeOverlay(overlay, () => resolve());
      }
      function onKey(e) {
        if (e.key === "Enter" || e.key === "Escape") finish();
      }
      okBtn.addEventListener("click", finish);
      overlay.addEventListener("click", (e) => { if (e.target === overlay) finish(); });
      document.addEventListener("keydown", onKey);
      okBtn.focus();
    });
  };

  window.showConfirm = function (message, opts) {
    opts = opts || {};
    const type = opts.type || (opts.danger ? "error" : "warn");
    const title = opts.title || (opts.danger ? "Confirmar" : "¿Confirmás?");
    const okLabel = opts.okLabel || (opts.danger ? "Sí, borrar" : "Sí");
    const cancelLabel = opts.cancelLabel || "Cancelar";
    return new Promise((resolve) => {
      const overlay = openOverlay(`
        <div class="uialert-box">
          <div class="uialert-icon ${type}">${ICONS[type] || ICONS.warn}</div>
          <div class="uialert-title">${escapeHtml(title)}</div>
          <div class="uialert-msg">${escapeHtml(message)}</div>
          <div class="uialert-btns">
            <button class="uialert-btn ghost" data-act="cancel">${escapeHtml(cancelLabel)}</button>
            <button class="uialert-btn ${opts.danger ? "danger" : "primary"}" data-act="ok">${escapeHtml(okLabel)}</button>
          </div>
        </div>
      `);
      function finish(result) {
        document.removeEventListener("keydown", onKey);
        closeOverlay(overlay, () => resolve(result));
      }
      function onKey(e) {
        if (e.key === "Escape") finish(false);
        if (e.key === "Enter") finish(true);
      }
      overlay.querySelector('[data-act="ok"]').addEventListener("click", () => finish(true));
      overlay.querySelector('[data-act="cancel"]').addEventListener("click", () => finish(false));
      overlay.addEventListener("click", (e) => { if (e.target === overlay) finish(false); });
      document.addEventListener("keydown", onKey);
      overlay.querySelector('[data-act="ok"]').focus();
    });
  };

  // opts.validate(value) puede devolver un string de error (se muestra
  // y no se cierra el cuadro) o null/undefined si esta todo bien.
  window.showPrompt = function (message, opts) {
    opts = opts || {};
    const title = opts.title || "Confirmá";
    const okLabel = opts.okLabel || "Aceptar";
    const cancelLabel = opts.cancelLabel || "Cancelar";
    const defaultValue = opts.defaultValue || "";
    const placeholder = opts.placeholder || "";
    return new Promise((resolve) => {
      const overlay = openOverlay(`
        <div class="uialert-box">
          <div class="uialert-icon info">${ICONS.info}</div>
          <div class="uialert-title">${escapeHtml(title)}</div>
          <div class="uialert-msg">${escapeHtml(message)}</div>
          <input class="uialert-input" type="text" value="${escapeHtml(defaultValue)}" placeholder="${escapeHtml(placeholder)}" />
          <div class="uialert-err"></div>
          <div class="uialert-btns">
            <button class="uialert-btn ghost" data-act="cancel">${escapeHtml(cancelLabel)}</button>
            <button class="uialert-btn primary" data-act="ok">${escapeHtml(okLabel)}</button>
          </div>
        </div>
      `);
      const input = overlay.querySelector(".uialert-input");
      const errEl = overlay.querySelector(".uialert-err");
      function finish(result) {
        document.removeEventListener("keydown", onKey);
        closeOverlay(overlay, () => resolve(result));
      }
      function tryOk() {
        const value = input.value;
        if (typeof opts.validate === "function") {
          const err = opts.validate(value);
          if (err) { errEl.textContent = err; input.focus(); return; }
        }
        finish(value);
      }
      function onKey(e) {
        if (e.key === "Escape") finish(null);
        if (e.key === "Enter") tryOk();
      }
      overlay.querySelector('[data-act="ok"]').addEventListener("click", tryOk);
      overlay.querySelector('[data-act="cancel"]').addEventListener("click", () => finish(null));
      overlay.addEventListener("click", (e) => { if (e.target === overlay) finish(null); });
      document.addEventListener("keydown", onKey);
      input.focus();
      input.select();
    });
  };
})();
