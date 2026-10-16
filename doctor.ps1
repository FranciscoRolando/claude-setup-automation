# doctor.ps1 - Diagnóstico de configuración de Claude Code
Write-Host "Iniciando diagnóstico del sistema..." -ForegroundColor Cyan

$allPassed = $true

function Check-Command ($cmd, $label) {
    if (Get-Command $cmd -ErrorAction SilentlyContinue) {
        Write-Host "[OK] $label detectado ($cmd)" -ForegroundColor Green
        return $true
    } else {
        Write-Host "[FALLO] $label no detectado ($cmd)" -ForegroundColor Red
        return $false
    }
}

# 1. Verificar herramientas base
Write-Host "`n1. Herramientas de sistema:" -ForegroundColor Yellow
$allPassed = (Check-Command "python" "Python") -and $allPassed
$allPassed = (Check-Command "pipx" "pipx") -and $allPassed
$allPassed = (Check-Command "git" "Git") -and $allPassed

# 2. Verificar instalaciones de pipx
Write-Host "`n2. Paquetes instalados:" -ForegroundColor Yellow
$pipxList = python -m pipx list
if ($pipxList -like "*graphifyy*") { Write-Host "[OK] graphifyy instalado" -ForegroundColor Green } else { Write-Host "[FALLO] graphifyy no encontrado" -ForegroundColor Red; $allPassed = $false }
if ($pipxList -like "*skillspector*") { Write-Host "[OK] skillspector instalado" -ForegroundColor Green } else { Write-Host "[FALLO] skillspector no encontrado" -ForegroundColor Red; $allPassed = $false }

# 3. Verificar archivos de configuración
Write-Host "`n3. Archivos de configuración:" -ForegroundColor Yellow
if (Test-Path ".claude\settings.json") {
    Write-Host "[OK] .claude\settings.json existe" -ForegroundColor Green
    $settings = Get-Content ".claude\settings.json" | ConvertFrom-Json
    Write-Host "   Plugins habilitados: $($settings.plugins.enabled -join ', ')" -ForegroundColor Gray
} else {
    Write-Host "[FALLO] .claude\settings.json no encontrado" -ForegroundColor Red
    $allPassed = $false
}

Write-Host "`n---" -ForegroundColor Cyan
if ($allPassed) {
    Write-Host "¡Todo parece estar en orden! El sistema está listo." -ForegroundColor Green
} else {
    Write-Host "Se encontraron problemas. Revisa los errores en rojo arriba." -ForegroundColor Yellow
}
