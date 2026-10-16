# Claude Code Setup Automation

Este repositorio contiene scripts para automatizar la configuración de herramientas, plugins y servidores MCP en Claude Code de forma modular.

## Contenido
- `config.json`: Definición centralizada de plugins y servidores MCP.
- `setup_full_project.ps1`: Script de instalación para Windows.
- `setup_full_project.sh`: Script de instalación para Linux.
- `doctor.ps1` / `doctor.sh`: Herramientas de diagnóstico para verificar el estado de la instalación.

## Instalación

1. Asegúrate de tener `config.json` configurado correctamente.
2. **Windows:** Ejecuta `.\setup_full_project.ps1`.
3. **Linux:** Ejecuta `./setup_full_project.sh`.
4. En la terminal de Claude Code, ejecuta: `/reload-plugins`

## Diagnóstico
Si algo no funciona, ejecuta la herramienta de diagnóstico:
- **Windows:** `.\doctor.ps1`
- **Linux:** `./doctor.sh`

## Requisitos previos
- Tener instalado `python` y `pipx`.
