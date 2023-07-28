#!/bin/bash

wget -qO "/app/archivos_generados/archivo.txt" https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv
generar_nombres(){
        archivo=$1
<<<<<<< HEAD
        nombre=$(shuf -n 1 "$archivo"|cut -d "," -f 1|tr -s " "tr " " "_")
=======
        nombre=$(shuf -n 1 "$archivo"|cut -d "," -f 1|tr -s " "|tr " " "_")
>>>>>>> rama_descargar
        echo "$nombre"
}

read -p "Ingrese una URL de la cual descargar la imagen: " enlace_imagen
read -p "Ingrese una URL para la suma de verificación: " enlace_texto

nombre=$(generar_nombres "/app/archivos_generados/archivo.txt")

wget "$enlace_imagen" -qO "/app/archivos_generados/$nombre.jpg"
wget "$enlace_texto" -qO "/app/archivos_generados/$nombre.txt"

if [[ $(sha256sum "/app/archivos_generados/$nombre.jpg"|cut -d " " -f 1) == $(cat "/app/archivos_generados/$nombre.txt") ]]; then
<<<<<<< HEAD
        echo "Las sumas de verificación coinciden."
=======
	echo "Las sumas de verificación coinciden."
>>>>>>> rama_descargar
else
        echo "Las sumas de verificación no coinciden."
        exit 1
fi
<<<<<<< HEAD


=======
>>>>>>> rama_descargar
