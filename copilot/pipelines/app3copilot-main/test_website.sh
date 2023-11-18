#!/bin/bash

# URL de tu servicio
URL=$1

# Descarga el contenido de la página
content=$(curl -s $URL)

# Comprueba si el contenido cumple con las expectativas
echo "Comprobando H1..."
if echo "$content" | grep -q "<h1>HOLA :D </h1>"; then
    echo "Prueba H1 pasada."
else
    echo "Prueba H1 fallida."
    exit 1
fi

echo "Comprobando H2..."
if echo "$content" | grep -q "MILUNADEV"; then
    echo "Prueba H2 pasada."
else
    echo "Prueba H2 fallida."
    exit 1
fi

echo "Comprobando imagen..."
if echo "$content" | grep -q 'img .* width="350"'; then
    echo "Prueba de imagen pasada."
else
    echo "Prueba de imagen fallida."
    exit 1
fi

echo "Todas las pruebas pasaron."
