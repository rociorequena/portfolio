#!/bin/bash

load_entrypoint_base(){
    echo "Loading base entrypoint configuration..."
    # Ejecuta el script de inicio base 
    bash /root/admin/base/start.sh
}

# Función para iniciar Nginx en primer plano
config_nginx() {
    echo "Starting Nginx in foreground..."
    # Ejecuta Nginx. La directiva 'daemon off;' es CRUCIAL para evitar que el contenedor se detenga.
    nginx -g 'daemon off;'
}

main(){
    # 1. Ejecutar la configuración base
    load_entrypoint_base
    
    # 2. Iniciar el servidor Nginx
    config_nginx
    
    # La línea 'tail -f /dev/null' ya no es estrictamente necesaria aquí 
    # si 'nginx -g daemon off;' se ejecuta como PID 1.
    # Pero si 'config_nginx' se ejecuta en segundo plano o falla, 
    # 'tail -f /dev/null' es una buena medida de seguridad para debugging.
    
    # Mantendremos 'tail -f /dev/null' solo para asegurarnos, aunque Nginx ya está en primer plano.
    # Si 'nginx -g daemon off;' es el último proceso en la función main, 
    # todo lo que esté después no se ejecutará hasta que Nginx se detenga.
    
    echo "Container processes running..."
    tail -f /dev/null
}
main