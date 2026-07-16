#!/bin/bash
# ==========================================
# RUNTIME EXECUTION - INTEGRATED IA CLAUDE WORKSPACE (SAFE SANDBOX)
# Protocolo de Seguridad EOB-v2606 (Direct Mode + Claude Backend)
# ==========================================
set -euo pipefail

# 1. Validación de Gobernanza Crítica (Variables de Entorno del Host)
if [ -z "${ANTHROPIC_API_KEY:-}" ]; then
    echo "❌ Error: La variable ANTHROPIC_API_KEY no está exportada en esta terminal."
    echo "👉 Ejecuta primero: export ANTHROPIC_API_KEY=\"tu_clave_anthropic_aquí\""
    exit 1
fi

# Nos aseguramos de tener un token para Claude Code en el entorno global si no existe
export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY:-sk-ant-localproxy-placeholder-token-auth-success}"

HOST_WORKSPACE="$(pwd -P)"
COMPOSE_FILE="$HOST_WORKSPACE/ai/claude_code/compose-claude.yml"

# 2. 🧹 Limpieza preventiva antes de arrancar la Jaula de Claude Code en primer plano
# Atacamos directamente los archivos reales. Cualquier cambio se gestionará con Git.
echo "🧹 Limpiando residuos de sesiones previas..."
docker compose -f "$COMPOSE_FILE" down >/dev/null 2>&1 || true

echo "🚀 Iniciando Ejecución de la Jaula de Claude Code en primer plano"
echo "🔄 Recreando infraestructura Claude en primer plano..."
echo "📂 Workspace Activo: $HOST_WORKSPACE"
echo "------------------------------------------"

echo "Ejecución interactiva de la Jaula de Claude Code vía Docker Compose"
docker compose -f "$COMPOSE_FILE" run --rm --name ia_claude_runtime ia_claude_runtime

# 3. 🧹 Limpieza al salir
echo "🧹Claude cerrado, limpiando servicios dependientes de fondo (ia_proxy)..."
# Detiene y elimina los servicios de este compose de forma segura
docker compose -f "$COMPOSE_FILE" down >/dev/null 2>&1 || true

echo "------------------------------------------"
echo "✅ Sesión de Claude Code en primer plano finalizada e infraestructura limpia."
echo "💡 Recuerda usar 'git status' o 'git diff' para revisar los cambios."
echo "------------------------------------------"
