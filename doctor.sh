#!/bin/bash
echo "Iniciando diagnóstico del sistema..."

all_passed=true

check_command() {
    if command -v "$1" &> /dev/null; then
        echo -e "\e[32m[OK] $2 detectado ($1)\e[0m"
        return 0
    else
        echo -e "\e[31m[FALLO] $2 no detectado ($1)\e[0m"
        all_passed=false
        return 1
    fi
}

# 1. Verificar herramientas base
echo -e "\n1. Herramientas de sistema:"
check_command "python3" "Python"
check_command "pipx" "pipx"
check_command "git" "Git"

# 2. Verificar instalaciones de pipx
echo -e "\n2. Paquetes instalados:"
pipx_list=$(pipx list)
if echo "$pipx_list" | grep -q "graphifyy"; then echo -e "\e[32m[OK] graphifyy instalado\e[0m"; else echo -e "\e[31m[FALLO] graphifyy no encontrado\e[0m"; all_passed=false; fi
if echo "$pipx_list" | grep -q "skillspector"; then echo -e "\e[32m[OK] skillspector instalado\e[0m"; else echo -e "\e[31m[FALLO] skillspector no encontrado\e[0m"; all_passed=false; fi

# 3. Verificar archivos de configuración
echo -e "\n3. Archivos de configuración:"
if [ -f ".claude/settings.json" ]; then
    echo -e "\e[32m[OK] .claude/settings.json existe\e[0m"
else
    echo -e "\e[31m[FALLO] .claude/settings.json no encontrado\e[0m"
    all_passed=false
fi

echo -e "\n---"
if [ "$all_passed" = true ]; then
    echo -e "\e[32m¡Todo parece estar en orden! El sistema está listo.\e[0m"
else
    echo -e "\e[33mSe encontraron problemas. Revisa los errores en rojo arriba.\e[0m"
fi
