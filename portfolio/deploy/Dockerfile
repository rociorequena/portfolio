# Archivo donde especifique la instalación de librerias  y confoguraciones necesarias para contenedores personalizados.
# 1. Partimos de una imagen de Docker con apache instalado
# FROM ubuntu + instalación personal de apache
FROM httpd:2.4
# Debemos consultar el docker hun (de la imagen) para ver variables de entorno, puertos, directorios de trabajo, etc.
# Directorio de trabajo dentro de la maquina(contenedor) 
WORKDIR /usr/local/apache2/htdocs
COPY ../src/ .
EXPOSE 80
