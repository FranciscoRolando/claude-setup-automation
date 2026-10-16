#!/bin/bash
echo "Iniciando automatización total en Linux..."

# 1. Instalar dependencias base
echo "Instalando dependencias base (graphifyy, skillspector)..."
pipx install graphifyy --force
pipx install --force 'skillspector[mcp] @ git+https://github.com/NVIDIA/skillspector.git'

# 2. Crear estructura .claude
mkdir -p .claude

# 3. Generar settings.json
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

echo "---"
echo "Configuración base terminada."
echo "PASO FINAL: Ejecuta /reload-plugins en tu terminal Claude Code."
