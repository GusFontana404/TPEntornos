------Documentación del repositorio------ 

Este repositorio proporciona un conjunto de scripts para realizar diversas operaciones relacionadas con la generación, descarga, descompresión, procesamiento y compresión de imágenes. Se incluye un dockerfile que permite desplegar el programa en un contenedor Docker y almacenar los archivos generados en una carpeta accesible para el host. A continuación se describen las características de cada script incluido en este repositorio:

1- generar.sh

El script generar.sh se utiliza para generar imágenes utilizando servicios web. El script acepta un argumento que indica la cantidad de imágenes a generar y asigna nombres al azar de una lista predefinida de nombres de personas. Después de generar las imágenes, se comprimen y se genera un archivo que contiene la suma de verificación de las imágenes generadas.

2- descargar.sh

El script descargar.sh se utiliza para descargar imágenes y verificar su integridad. Se deben proporcionar dos URLs como argumentos: una para las imágenes y otra para la suma de verificación. El script descarga ambos archivos y verifica que la suma de verificación del archivo de imágenes coincida con la suma de verificación proporcionada. En todos los casos, el usuario recibe notifiación de la ejecución.

3- descomprimir.sh

El script descomprimir.sh se encarga de descomprimir el archivo descargado o generado con los scripts anteriores. Verifica la existencia del archivo y procede a descomprimirlo utilizando un nombre común para ambos. El usuario es notificado del resultado de la ejecucion.

4- procesar.sh

El script procesar.sh recorta las imágenes a una resolución de 512x512 utilizando la herramienta ImageMagick. Solo se procesan las imágenes con nombres de personas válidos. Se considera un nombre de persona válido cualquier combinación de palabras que comience con una letra mayúscula y continúe con letras minúsculas. Las imágenes procesadas se guardarán en un directorio especificado.

5- comprimir.sh

El script comprimir.sh se encarga de realizar varias tareas después de procesar las imágenes. Genera un archivo que contiene una lista de nombres de todas las imágenes procesadas. También genera un archivo separado que contiene una lista de nombres de personas válidos encontradas en las imágenes. Además, se genera otro archivo con el recuento total de personas cuyos nombres terminan con la letra "a". Por último, se crea un archivo comprimido que incluye todos los archivos generados anteriormente, así como todas las imágenes procesadas. Este archivo comprimido se puede acceder desde fuera del contenedor.

6- menu.sh

El script menu.sh proporciona un menú interactivo para seleccionar cada una de las opciones mencionadas anteriormente. Al ejecutar este script, se mostrará un menú en el que el usuario puede elegir una opción para realizar una determinada operación. Cada opción corresponde a uno de los scripts mencionados anteriormente.

------Despliegue del Contenedor Docker-----

Instrucciones para desplegar el contenedor Docker:

1- Asegúrese de tener Docker instalado en su sistema.

En una terminal se puede escribir el siguiente comando para verificarlo: docker --version (En caso de no contar con el programa, es necesario instalarlo)

2- Para crear la imagen es necesario el uso del Dockerfile que se encuentra incluido en el repositorio con las siguientes instrucciones:

Se usa una imagen base con soporte para Debian FROM debian:latest

#Se copian los scripts al contenedor COPY trabajo/*.sh /app/

#Se establece el directorio de trabajo WORKDIR /app

#Se instalan comandos necesario para el uso de los scripts RUN apt-get update && apt-get install -y imagemagic wget zip

#Se otorgan los permisos de ejecución a los scripts RUN chmod +x *.sh

#Se establece el comando por defecto al ejecutar el contenedor CMD ["/app/menu.sh"]

3- Cree la imagen ejecutando el siguiente comando:

docker build -t nombre_imagen . (Reemplace 'nombre_imagen' por el nombre que desee darle a la imagen)

4- Una vez creada la imagen, puede correr el contenedor con la siguiente instrucción: docker run -it -v /home/usuario/archivos_generados:/app/archivos_generados nombre_imagen (Reemplace 'nombre_imagen' por el nombre que desee darle a la imagen)

El comando ejecutara el menú desde el contenedor y la opción -v permitira acceder al contenido generado desde fuera.

LINKS PARA PROBAR LA DESCARGA DE IMÁGENES EN EL MENÚ CON LA COMPROBACIÓN DE SUMA: 
-Link imagen: https://raw.githubusercontent.com/GusFontana404/imagen/main/Walter_Favio.jpg 
-Link suma correcta: https://raw.githubusercontent.com/GusFontana404/suma/main/README.txt 
-Link suma incorrecta: https://raw.githubusercontent.com/GusFontana404/suma_mal/main/README.txt
