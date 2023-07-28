#!/bin/bash

imagenes=$(find "/app/archivos_generados" -type f | grep -E "[A-Z][a-z]+(_[A-Z][a-z]+)*\.jpg$")

if [ -n "$imagenes" ]; then
	for imagen in $imagenes; do
        	convert "$imagen" -resize 512x512\! "$imagen"
        done
	echo "Se modificaron exitosamente las resoluciones de las imágenes"
else
        echo "No se encontraron imágenes para convertir" 
fi
