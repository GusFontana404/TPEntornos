#!/bin/bash

wget -qO "/app/archivos_generados/archivo.txt"  https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv

generar_nombres(){
        archivo=$1
	nombre=$(shuf -n 1 "$archivo"|cut -d "," -f 1|tr -s " "|tr " " "_"|sed "s/[áéíóúÁÉÍÓÚ]/[aeiouAEIOU]/g")
	echo "$nombre"
}

read -p "Ingrese la cantidad de imágenes que desea generar: " cantidad
for (( i=1; i<=cantidad; i++));do
		nombre=$(generar_nombres "/app/archivos_generados/archivo.txt")
		wget -qO "/app/archivos_generados/$nombre.jpg" https://thispersondoesnotexist.com/
		gzip "/app/archivos_generados/$nombre.jpg"
		sha256sum "/app/archivos_generados/$nombre.jpg.gz"| cut -d " " -f 1 > "/app/archivos_generados/$nombre.txt"
		sleep 1
	echo "Se generó correctamente la imagen"
	done

