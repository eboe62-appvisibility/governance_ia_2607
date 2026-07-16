#!/bin/bash
# ==========================================
# RUNTIME EXECUTION - BACKGROUND IA WORKSPACE FOR CLINE / VSC
# Protocolo de Seguridad EOB-v2606 (Daemon Mode + NVIDIA Backend)
# ==========================================
set -euo pipefail

# 1. Validación de Gobernanza Crítica (Variables de Entorno del Host)
if [ -z "${NVIDIA_NIM_API_KEY:-}" ]; then
    echo "❌ Error: La variable NVIDIA_NIM_API_KEY no está exportada en esta terminal."
    echo "👉 Ejecuta primero: export NVIDIA_NIM_API_KEY=\"tu_clave_NVIDIA_aquí\""
    exit 1
fi

HOST_WORKSPACE="$(pwd -P)"
COMPOSE_FILE="$HOST_WORKSPACE/ai/opencode/opencode-nvidia/compose-opencode.yml"
COMPOSE_ALTERNATIVE="$HOST_WORKSPACE/ai/opencode/opencode-gemini/compose-opencode.yml"

# 2. 🧹 Limpieza preventiva antes de arrancar la Jaula de Claude Code en primer plano
# Atacamos directamente los archivos reales. Cualquier cambio se gestionará con Git.
echo "🧹 Limpiando residuos de sesiones previas..."
docker compose -f "$COMPOSE_FILE" down >/dev/null 2>&1 || true
docker compose -f "$COMPOSE_ALTERNATIVE" down >/dev/null 2>&1 || true

echo "🚀 Iniciando Ejecución de la Jaula de Claude Code en segundo plano con esteroides de NVIDIA"
echo "🔄 Recreando infraestructura Claude en segundo plano..."
echo "📂 Workspace Activo: $HOST_WORKSPACE"
echo "------------------------------------------"

echo "Ejecución en segundo plano de la Jaula de Claude Code vía Docker Compose"
docker compose -f "$COMPOSE_FILE" up -d --force-recreate

# 3. Esperamos a que esté realmente listo (Healthcheck)
echo "⏳ Esperando a que el backend de Claude esté operativo..."
# Ejemplo: Esperar a que el puerto 8082 (o el que use tu proxy) responda
for i in {1..10}; do
    if nc -z localhost 8000 >/dev/null 2>&1; then
        echo "✅ Jaula de Claude en segundo plano lista y escuchando."
        exit 0
    fi
    sleep 1
done

# 4. 🚨 Control de errores (solo se ejecuta si el Healthcheck falla)
echo "------------------------------------------"
echo "❌ Error: El contenedor arrancó, pero el puerto no responde tras 10 segundos Revisa 'docker logs'."
echo "🧹 Limpiando infraestructura fallida para evitar conflictos de puertos..."

docker compose -f "$COMPOSE_FILE" down >/dev/null 2>&1 || true

echo "❌ Ejecución del Daemon cancelada por fallo en el backend."
echo "------------------------------------------"
exit 1
