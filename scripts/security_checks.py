#!/usr/bin/env python3
"""Controles estaticos que evitan reintroducir los hallazgos principales."""

from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
failures: list[str] = []

def check(condition: bool, message: str) -> None:
    if not condition:
        failures.append(message)

def read(path: str) -> str:
    return (ROOT / path).read_text(encoding="utf-8")

migration = read("db/018-security-hardening.sql")
webhook = read("supabase/functions/notify-match-queue/index.ts")
importer = read("importar-fixture.html")
live = read("live.html")
html = "\n".join(p.read_text(encoding="utf-8") for p in ROOT.glob("*.html"))

check("auth.uid() is null or not" in migration, "finalize_match debe validar al invocante")
check("revoke execute on function public.finalize_match(text) from anon" in migration,
      "finalize_match debe estar revocada para anon")
check('Deno.env.get("MATCH_WEBHOOK_SECRET") || ""' not in webhook,
      "el secreto del webhook no puede ser opcional")
check('req.method !== "POST"' in webhook, "el webhook debe aceptar solo POST")
check("${escapeHtmlLocal(w.detail)}" in importer, "las advertencias del Excel deben escaparse")
check("${escapeHtmlLocal(m.categoria)}" in importer, "la categoria del Excel debe escaparse")
check("safeYouTubeUrl" in live and 'rel="noopener noreferrer"' in live,
      "los enlaces externos deben validarse")
check("@supabase/supabase-js@2\"" not in html,
      "supabase-js debe usar una version exacta")
check("SUPABASE_SERVICE_ROLE_KEY = \"" not in "\n".join(
      p.read_text(encoding="utf-8", errors="ignore")
      for p in ROOT.rglob("*") if p.is_file() and ".git" not in p.parts
    ), "no se deben hardcodear claves service_role")

if failures:
    print("Security checks FAILED:")
    for item in failures:
        print(f"- {item}")
    sys.exit(1)

print("Security checks OK")
