### Partimos de una imagen ubuntu donde se instalará apache
FROM ubuntu:latest

ARG USUARIO=rocio

## Instalaciones básicas
RUN apt update && apt install -yq --no-install-recommends \
    apache2 \
    nano \
    curl \
    net-tools \
    iputils-ping && \
    rm -rf /var/lib/apt/lists/*

### Creación de usuarios
RUN useradd -rm -d /home/${USUARIO} -s /bin/bash ${USUARIO}
RUN echo "Bienvenido al mundo de ${USUARIO}" > /home/${USUARIO}/hello.txt

### Directorio de trabajo dentro del contenedor
WORKDIR /var/www/html

### Copiamos el código fuente
COPY ./src .

### Exponemos el puerto
EXPOSE 80

### Iniciamos Apache en primer plano
CMD ["apache2ctl", "-D", "FOREGROUND"]
