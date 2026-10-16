# setup_full_project.ps1 - Automatización completa de configuración modular
Write-Host "Iniciando automatización total..." -ForegroundColor Cyan

# 0. Cargar configuración desde config.json
if (-not (Test-Path "config.json")) {
    Write-Host "Error: No se encontró config.json. Abortando." -ForegroundColor Red
    exit 1
}
$config = Get-Content -Raw "config.json" | ConvertFrom-Json

# 1. Instalar dependencias base de Python
Write-Host "Instalando dependencias base de Python..." -ForegroundColor Green

# Extraer comandos de MCP servers que necesitan instalación base
# Por ahora skillspector es especial porque usa git, lo mantenemos como instalación manual de respaldo
# Pero podemos automatizarlo si está en pipx
python -m pipx install graphifyy --force
python -m pipx install --force 'skillspector[mcp] @ git+https://github.com/NVIDIA/skillspector.git'

# 2. Crear estructura de carpetas .claude
if (-not (Test-Path ".claude")) {
    New-Item -ItemType Directory -Path ".claude"
}

# 3. Generar settings.json basado en config.json
Write-Host "Configurando settings.json..." -ForegroundColor Green

$settings = [PSCustomObject]@{
    plugins = @{
        enabled = $config.plugins
    }
    mcpServers = $config.mcpServers
}

$settings | ConvertTo-Json -Depth 10 | Out-File -FilePath ".claude\settings.json" -Encoding utf8

Write-Host "---" -ForegroundColor Cyan
Write-Host "Configuración base terminada." -ForegroundColor Cyan
Write-Host "PASO FINAL: Ejecuta el siguiente comando en tu terminal para aplicar todo:" -ForegroundColor Yellow
Write-Host "/reload-plugins" -ForegroundColor White -BackgroundColor DarkBlue
