## Entorno de Programación

## Trabajo Práctico final

Este repositorio proporciona un conjunto de scripts para realizar diversas operaciones relacionadas con la generación, descarga, descompresión, procesamiento y compresión de imágenes. 
Se incluye un dockerfile que permite desplegar el programa en un contenedor Docker y almacenar los archivos generados en una carpeta accesible para el host. 

A continuación se describen las características de cada script incluido en este repositorio:

-   `generar.sh`
El script generar.sh se utiliza para generar imágenes utilizando servicios web. El script acepta un argumento que indica la cantidad de imágenes a generar y asigna nombres al azar de una lista predefinida de nombres de personas. Después de generar las imágenes, se comprimen y se genera un archivo que contiene la suma de verificación de las imágenes generadas.

-   `descargar.sh`
El script descargar.sh se utiliza para descargar imágenes y verificar su integridad. Se deben proporcionar dos URLs como argumentos: una para las imágenes y otra para la suma de verificación. El script descarga ambos archivos y verifica que la suma de verificación del archivo de imágenes coincida con la suma de verificación proporcionada. En todos los casos, el usuario recibe notifiación de la ejecución.

-   `descomprimir.sh`
El script descomprimir.sh se encarga de descomprimir el archivo descargado o generado con los scripts anteriores. Verifica la existencia del archivo y procede a descomprimirlo utilizando un nombre común para ambos. El usuario es notificado del resultado de la ejecucion.

-   `procesar.sh`
El script procesar.sh recorta las imágenes a una resolución de 512x512 utilizando la herramienta ImageMagick. Solo se procesan las imágenes con nombres de personas válidos. Se considera un nombre de persona válido cualquier combinación de palabras que comience con una letra mayúscula y continúe con letras minúsculas. Las imágenes procesadas se guardarán en un directorio especificado.

-   `comprimir.sh`
El script comprimir.sh se encarga de realizar varias tareas después de procesar las imágenes. Genera un archivo que contiene una lista de nombres de todas las imágenes procesadas. También genera un archivo separado que contiene una lista de nombres de personas válidos encontradas en las imágenes. Además, se genera otro archivo con el recuento total de personas cuyos nombres terminan con la letra "a". Por último, se crea un archivo comprimido que incluye todos los archivos generados anteriormente, así como todas las imágenes procesadas. Este archivo comprimido se puede acceder desde fuera del contenedor.

-   `menu.sh`
El script menu.sh proporciona un menú interactivo para seleccionar diferentes opciones. Al ejecutar este script, se mostrará un menú en el que el usuario puede elegir una opción para realizar una determinada operación. Cada opción corresponde a uno de los scripts mencionados anteriormente.

## Despliegue del Contenedor Docker

Instrucciones para desplegar el contenedor Docker:
-   Asegúrese de tener Docker instalado en su sistema.
En una terminal se puede escribir el siguiente comando para verificarlo: docker --version (En caso de no contar con el programa, es necesario instalarlo)
-   Para crear la imagen es necesario el uso del Dockerfile, el cual se encuentra incluido en el repositorio.
`Las instrucciones del Dockerfile son las siguientes:`
-   Usar una imagen base con soporte para Debian FROM debian:latest
-   Copiar los scripts al contenedor COPY trabajo/*.sh /app/
-   Establecer el directorio de trabajo WORKDIR /app
-   Instalar comandos necesario para el uso de los scripts RUN apt-get update && apt-get install -y imagemagic wget zip
-   Otorgar los permisos de ejecución a los scripts RUN chmod +x *.sh
-   Establecer el comando por defecto al ejecutar el contenedor CMD ["/app/menu.sh"]

-   Cree la imagen ejecutando el siguiente comando:

docker build -t nombre_imagen . (Reemplace 'nombre_imagen' por el nombre que desee)

-   Una vez creada la imagen, puede correr el contenedor con la siguiente instrucción:

docker run -it -v /home/usuario/archivos_generados:/app/archivos_generados nombre_imagen (Reemplace 'nombre_imagen' por el nombre que desee)

El comando ejecutara el menú desde el contenedor y la opción -v permitira acceder al contenido generado desde fuera.

## Links para probar la función de desacarga de imágenes del menú y la comprobación de suma: 
-   ['Link imagen'](https://drive.google.com/file/d/1MPOlGpw74KlYQ4bkX63ap9S8vQntRf0L/view?usp=drive_link) 
-   ['Link suma correcta'](https://drive.google.com/file/d/1H5GsgPgXSEqTgKnmc3q4Z7y7zqh1xxZc/view?usp=drive_link)
-   ['Link suma incorrecta'](https://drive.google.com/file/d/1jD7nyM6iXsRUgYsJgQtiA-nHvfezYPfl/view?usp=drive_link)
