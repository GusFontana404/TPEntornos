#!/bin/bash

archivos_comprimidos=$(find "/app/archivos_generados" -type f | grep -Ei "[a-zA-Z]+(_[a-zA-Z]+)*\.jpg\.gz$")

descomprimir_archivos(){
	if [ -n "$archivos_comprimidos" ]; then
		for archivo in $archivos_comprimidos; do
			gzip -d "$archivo"
		done
  	echo "Se descomprimieron correctamente los archivos"
	else
		echo "No se encontraron archivos para descomprimir"
	fi
}

descomprimir_archivos
