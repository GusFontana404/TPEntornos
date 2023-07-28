#!/bin/bash

while true; do
  echo ""
  echo "-------------Menú de opciones-------------"
	echo "1- Generar imágenes"
	echo "2- Descargar imágenes"
	echo "3- Descomprimir archivo"
	echo "4- Procesar imágenes"
	echo "5- Comprimir archivos finales"
	echo "6- Salir del menú"
	echo ""	
	read -p "Seleccione una opción: " OPCION

	case $OPCION in
		1)
		./generar.sh
		;;
		2)
		./descargar.sh 
		;;
		3)
		./descomprimir.sh
		;;
		4)
		./procesar.sh
		;;
		5)
		./comprimir.sh
		;;
		6)
		echo "Saliendo"
		exit 0
		;;
		*)
		echo "Opción incorrecta"
		;;
		esac
	done
