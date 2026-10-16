# Claude Code Setup Automation

Este repositorio contiene scripts para automatizar la configuración de herramientas, plugins y servidores MCP en Claude Code.

## Contenido
- `setup_full_project.ps1`: Script de instalación para Windows.
- `setup_full_project.sh`: Script de instalación para Linux.

## Instalación

### Windows
1. Abre PowerShell en la carpeta raíz de tu proyecto.
2. Ejecuta el script: `.\setup_full_project.ps1`
3. En la terminal de Claude Code, ejecuta: `/reload-plugins`

### Linux
1. Abre tu terminal en la carpeta raíz de tu proyecto.
2. Dale permisos de ejecución: `chmod +x setup_full_project.sh`
3. Ejecuta el script: `./setup_full_project.sh`
4. En la terminal de Claude Code, ejecuta: `/reload-plugins`

## Requisitos previos
- Tener instalado `python` y `pipx`.
