#!/bin/bash

# Obtener el nombre de la carpeta actual
current_dir=$(basename "$PWD")

# Comprobar si el nombre de la carpeta actual es 'src'
if [ "$current_dir" == "src" ]; then
    echo "Estás en la carpeta 'src'. Comprobando y creando carpetas..."

    # Lista de carpetas a crear
    directories=(
        "app/componentes/contenedor"
        "app/mocks"
        "app/modelos"
        "app/utilidades/dominios"
        "app/utilidades/funciones"
        "app/utilidades/misHooks"
        "app/utilidades/rutas"
    )

    for dir in "${directories[@]}"; do
        if [ -d "$dir" ]; then
            echo "La carpeta '$dir' ya existe."
        else
            mkdir -p "$dir"
            echo "Creando la carpeta '$dir'."
        fi
    done

    # Lista de librerías a verificar e instalar
    libraries=(
        "bootstrap"
        "bootstrap-icons"
        "react-bootstrap"
        "react-router-dom"
        "react-toastify"
        "@fortawesome/fontawesome-free"
        "js-sha512"
        "jwt-decode"
    )

    for lib in "${libraries[@]}"; do
        if npm list "$lib" --depth=0 &>/dev/null; then
            echo "La librería '$lib' ya está instalada."
        else
            echo "Instalando la librería '$lib'..."
            npm install "$lib"
        fi
    done

else
    echo "Error: Debes estar en la carpeta 'src' para ejecutar este script."
    exit 1
fi
