#!/bin/bash
# set -e

# config_nginx(){

#    # Inicia Nginx en segundo plano

#    #Para lanzar Nginx en segundo plano y mantener el contenedor activo, n

#    #ecesitas un proceso en primer plano que evite que Docker finalice el contenedor.

#    #Nginx, por defecto, se ejecuta como un demonio (en segundo plano),

#    #pero Docker requiere un proceso principal activo en el contenedor.

#    nginx &

#    # Mantener el contenedor activo ejecutando Nginx en primer plano

#    # exec nginx -g "daemon off;"

#    # Mantén el contenedor vivo

#    #tail -f /dev/null

# }
# load_entrypoint_base(){
#    #ejecutar entrypoint ubbase
#    bash /root/admin/base/start.sh
# }
# main(){
#   load_entrypoint_base
#    config_nginx
#    tail -f /dev/null  
# }
# main




set -e

# ... (parte load_entrypoint_base se mantiene igual)

config_nginx(){
   # Inicia Nginx en primer plano, lo que mantiene el contenedor activo
   echo "Iniciando Nginx en primer plano..."
   exec nginx -g "daemon off;"
}

load_entrypoint_base(){
    #ejecutar entrypoint ubbase
    # Nota: Asegúrate de que este script exista en la base
    bash /root/admin/base/start.sh 
}

main(){
    load_entrypoint_base
    config_nginx
    
    # Se elimina la llamada a 'tail -f /dev/null' ya que 'exec nginx -g "daemon off;"'
    # toma el control del proceso principal y evita que el contenedor caiga.
}

main