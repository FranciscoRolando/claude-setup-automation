# setup_full_project.ps1 - Automatización completa de configuración
Write-Host "Iniciando automatización total..." -ForegroundColor Cyan

# 1. Instalar dependencias base de Python
Write-Host "Instalando dependencias base (graphifyy, skillspector)..." -ForegroundColor Green
python -m pipx install graphifyy --force
python -m pipx install --force 'skillspector[mcp] @ git+https://github.com/NVIDIA/skillspector.git'

# 2. Crear estructura de carpetas .claude
if (-not (Test-Path ".claude")) {
    New-Item -ItemType Directory -Path ".claude"
}

# 3. Generar settings.json para configurar plugins y MCP
Write-Host "Configurando settings.json..." -ForegroundColor Green
$settings = @"
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
"@
$settings | Out-File -FilePath ".claude\settings.json" -Encoding utf8

Write-Host "---" -ForegroundColor Cyan
Write-Host "Configuración base terminada." -ForegroundColor Cyan
Write-Host "PASO FINAL: Ejecuta el siguiente comando en tu terminal para aplicar todo:" -ForegroundColor Yellow
Write-Host "/reload-plugins" -ForegroundColor White -BackgroundColor DarkBlue
