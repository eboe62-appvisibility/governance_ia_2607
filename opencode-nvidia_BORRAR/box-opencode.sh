#!/bin/bash
# ==========================================
# RUNTIME EXECUTION - INTEGRATED IA CLAUDE WORKSPACE (SAFE SANDBOX)
# Protocolo de Seguridad EOB-v2606 (Direct Mode + Gemini Backend)
# ==========================================
set -euo pipefail

# 1. Validación de Gobernanza Crítica (Variables de Entorno del Host)
if [ -z "${GEMINI_API_KEY:-}" ]; then
    echo "❌ Error: La variable GEMINI_API_KEY no está exportada en esta terminal."
    echo "👉 Ejecuta primero: export GEMINI_API_KEY=\"tu_clave_gemini_aquí\""
    exit 1
fi

# Nos aseguramos de tener un token para Claude Code en el entorno global si no existe
export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY:-sk-ant-localproxy-placeholder-token-auth-success}"

HOST_WORKSPACE="$(pwd -P)"
COMPOSE_FILE="$HOST_WORKSPACE/ai/opencode-nvidia/compose-opencode.yml"

echo "🚀 Iniciando Ejecución de la Jaula de Claude Code  con esteroides de Gemini vía Docker Compose"
echo "📂 Workspace Activo: $HOST_WORKSPACE"
echo "------------------------------------------"

# 2. Ejecución de la Jaula vía Docker Compose
# Atacamos directamente los archivos reales. Cualquier cambio se gestionará con Git.

echo "Ejecución de la Jaula de Claude Code vía Docker Compose"
docker compose -f "$COMPOSE_FILE" run --rm --name ia_opencode_gemini_runtime ia_opencode_runtime

echo "🧹 Limpiando servicios dependientes en segundo plano (ia_proxy)..."
docker compose -f "$COMPOSE_FILE" rm -f -s ia_proxy >/dev/null 2>&1 || true

echo "------------------------------------------"
echo "✅ Sesión de Claude Code finalizada."
echo "💡 Recuerda usar 'git status' o 'git diff' para revisar los cambios."
echo "------------------------------------------"
