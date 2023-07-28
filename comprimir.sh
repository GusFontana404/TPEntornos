#!/bin/bash

archivo_con_nombres="nombre_todas_las_imagenes.txt"
archivo_con_nombres_validos="nombres_validos_imagenes.txt"
nombres_finalizan_en_a="total_nombres_a.txt"
todas_las_imagenes=$(find "/app/archivos_generados" -type f | grep -Ei "[a-zA-Z]+(_[a-zA-Z]+)*\.jpg$")


find "/app/archivos_generados" -type f | grep -E "[A-Z][a-z]+(_[A-Z][a-z]+)*.jpg$" > "$archivo_con_nombres_validos"

find "/app/archivos_generados" -type f | grep -Ei "[A-Z][a-z]+(_[A-Z][a-z]+)*a.jpg$" | wc -w > "$nombres_finalizan_en_a"

find "/app/archivos_generados" -type f | grep -Ei "[A-Z][a-z]+(_[A-Z][a-z]+)*.jpg$" > "$archivo_con_nombres"

zip -qj "/app/archivos_generados/archivos_comprimidos.zip" "$archivo_con_nombres" "$archivo_con_nombres_validos" "$nombres_finalizan_en_a" $todas_las_imagenes

echo "Se comprimieron correctamente todos los archivos"
