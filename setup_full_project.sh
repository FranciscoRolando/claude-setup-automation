#!/bin/bash
echo "Iniciando automatización total modular..."

# 0. Verificar config.json
if [ ! -f "config.json" ]; then
    echo "Error: No se encontró config.json"
    exit 1
fi

# 1. Instalar dependencias base
echo "Instalando dependencias base (graphifyy, skillspector)..."
pipx install graphifyy --force
pipx install --force 'skillspector[mcp] @ git+https://github.com/NVIDIA/skillspector.git'

# 2. Crear estructura .claude
mkdir -p .claude

# 3. Generar settings.json
# Intentamos usar jq si está disponible, si no, usamos el archivo estático por ahora
if command -v jq &> /dev/null; then
    echo "Generando settings.json dinámicamente con jq..."
    jq '{plugins: {enabled: .plugins}, mcpServers: .mcpServers}' config.json > .claude/settings.json
else
    echo "Aviso: jq no está instalado. Usando configuración predeterminada."
    cat <<EOF > .claude/settings.json
{
  "plugins": {
    "enabled": [
      "ponytail",
      "claude-mem-cowork",
      "agent-skills"
    ]
  },
  "mcpServers": {
    "skillspector": {
      "command": "skillspector",
      "args": ["mcp"]
    }
  }
}
EOF
fi

echo "---"
echo "Configuración base terminada."
echo "PASO FINAL: Ejecuta /reload-plugins en tu terminal Claude Code."
