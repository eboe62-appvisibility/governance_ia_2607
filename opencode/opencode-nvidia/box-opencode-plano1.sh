#!/bin/bash
# ==========================================
# RUNTIME EXECUTION - INTEGRATED IA CLAUDE WORKSPACE (SAFE SANDBOX)
# Protocolo de Seguridad EOB-v2606 (Direct Mode + NVIDIA Backend)
# ==========================================

# DESESTIMADO: ESTA EJECUCION NO ES VALIDA PARA USO EN PRODUCCION. SOLO PARA PRUEBAS LOCALES DE DESARROLLO Y DEBUGGING.
# Claude Code se inicia simulando Opus 4.5, pero el modelo (Llama) se "asusta" al ver tantas herramientas disponibles en el prompt del sistema y se vuelve loco ("However, the functions provided are numerous..."). # # Cuando le pides algo simple como un número aleatorio, el modelo dice que no tiene acceso a una función randint.
#
# Posibles causas:
# Incompatibilidad de Tool Calling: Claude Code inyecta dinámicamente decenas de herramientas CLI y de sistema en el payload. Llama-3.3-70b a través de NIM no sabe cómo procesar esa estructura de herramientas al # # estilo Anthropic, confunde el formateo y asume que el usuario quiere que adivine qué función ejecutar de forma genérica.
#
# Al no tener capacidades nativas para entender el formato exacto de herramientas de Claude, el modelo responde con texto plano en lugar de invocar la herramienta correcta del cliente.
#
# Soluciones: * Claude Code es una herramienta CLI extremadamente acoplada a los modelos nativos de Anthropic. No está diseñada para proxies con Llama. Si quieres usar esta arquitectura de proxy, es preferible usar # Cline en VS Code o Aider, configurándolos en modo "Texto plano / instrucciones en Prompt" en lugar de Tool Calling nativo.

set -euo pipefail

# 1. Validación de Gobernanza Crítica (Variables de Entorno del Host)
if [ -z "${NVIDIA_NIM_API_KEY:-}" ]; then
    echo "❌ Error: La variable NVIDIA_NIM_API_KEY no está exportada en esta terminal."
    echo "👉 Ejecuta primero: export NVIDIA_NIM_API_KEY=\"tu_clave_NVIDIA_aquí\""
    exit 1
fi

# Nos aseguramos de tener un token para Claude Code en el entorno global si no existe
export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY:-sk-ant-localproxy-placeholder-token-auth-success}"

HOST_WORKSPACE="$(pwd -P)"
COMPOSE_FILE="$HOST_WORKSPACE/ai/opencode/opencode-nvidia/compose-opencode.yml"
COMPOSE_ALTERNATIVE="$HOST_WORKSPACE/ai/opencode/opencode-gemini/compose-opencode.yml"

# 2. 🧹 Limpieza preventiva antes de arrancar la Jaula de Claude Code en primer plano
# Atacamos directamente los archivos reales. Cualquier cambio se gestionará con Git.
echo "🧹 Limpiando residuos de sesiones previas..."
docker compose -f "$COMPOSE_FILE" down >/dev/null 2>&1 || true
docker compose -f "$COMPOSE_ALTERNATIVE" down >/dev/null 2>&1 || true

echo "🚀 Iniciando Ejecución de la Jaula de Claude Code en primer plano con esteroides de NVIDIA"
echo "🔄 Recreando infraestructura Claude en primer plano..."
echo "📂 Workspace Activo: $HOST_WORKSPACE"
echo "------------------------------------------"

echo "Ejecución interactiva de la Jaula de Claude Code vía Docker Compose"
docker compose -f "$COMPOSE_FILE" run --rm --name ia_opencode_nvidia_runtime ia_opencode_nvidia_runtime

# 3. 🧹 Limpieza al salir
echo "🧹Claude cerrado, limpiando servicios dependientes de fondo (ia_proxy)..."
# Detiene y elimina los servicios de este compose de forma segura
docker compose -f "$COMPOSE_FILE" down >/dev/null 2>&1 || true

echo "------------------------------------------"
echo "✅ Sesión de Claude Code en primer plano finalizada e infraestructura limpia."
echo "💡 Recuerda usar 'git status' o 'git diff' para revisar los cambios."
echo "------------------------------------------"
