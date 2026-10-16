# 🚀 Claude Code Setup Automation

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-green.svg)](https://github.com/FranciscoRolando/claude-setup-automation)

---

Automatización profesional y modular para configurar tu entorno de desarrollo con **Claude Code**. Este repositorio te permite estandarizar la instalación de plugins, herramientas MCP y configuraciones de forma rápida y reproducible.

## 🌟 Características Principales

- **⚙️ Configuración Centralizada:** Todo tu entorno definido en un único `config.json`.
- **🚀 Multiplataforma:** Scripts optimizados para **Windows (PowerShell)** y **Linux/macOS (Bash)**.
- **🛡️ Diagnóstico Integrado:** Herramientas de "doctor" para verificar que todo esté funcionando correctamente.
- **⚡ Automatización Total:** Instala plugins, servidores MCP y estructura tu proyecto en segundos.

---

## 🛠️ Instalación Rápida

### 1. Preparación
Asegúrate de tener instalados:
- [Python 3.10+](https://www.python.org/)
- [pipx](https://pypa.github.io/pipx/)

### 2. Configuración Modular
Edita el archivo `config.json` en la raíz para definir qué plugins y servidores MCP deseas instalar:

```json
{
  "plugins": ["ponytail", "claude-mem-cowork", "agent-skills"],
  "mcpServers": {
    "skillspector": { "command": "skillspector", "args": ["mcp"] }
  }
}
```

### 3. Ejecución
**En Windows:**
```powershell
.\setup_full_project.ps1
/reload-plugins
```

**En Linux / macOS:**
```bash
chmod +x setup_full_project.sh
./setup_full_project.sh
/reload-plugins
```

---

## 🩺 Diagnóstico y Verificación

Si experimentas problemas, usa las herramientas de diagnóstico incluidas:

- **Windows:** `.\doctor.ps1`
- **Linux/macOS:** `./doctor.sh`

Este comando verificará:
✅ Instalación de dependencias (Python, pipx, Git).
✅ Estado de los paquetes instalados (`graphifyy`, `skillspector`).
✅ Integridad del archivo `.claude/settings.json`.

---

## 🤝 Contribuciones
¡Las contribuciones son bienvenidas! Si tienes mejoras para los scripts o nuevas configuraciones para el `config.json`, por favor abre un *Issue* o envía un *Pull Request*.

---
🤖 Generado con [Claude Code](https://claude.com/claude-code)
