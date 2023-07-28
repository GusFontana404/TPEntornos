#Usamos una imagen base con soporte para Bash
FROM debian:latest
LABEL Estudiantes TUIA

#Copiamos los scripts al contenedor
COPY ./*.sh /app/

#Establecemos el directorio de trabajo
WORKDIR /app

#Comando para ajustar la resolucion de las imagenes
RUN apt-get update && apt-get install -y imagemagick wget zip

#Damos permiso de ejecucion de a los scripts
RUN chmod +x *.sh

#Establecemos el comando por defecto al ejecutar el contenedor
CMD [ "/app/menu.sh" ] 
