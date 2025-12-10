#!/bin/bash

load_entrypoint_base(){
    echo "Loading base entrypoint configuration..."
    bash /root/admin/base/start.sh
}

config_nginx() {
    echo "Starting Nginx in foreground..."
    nginx -g 'daemon off;'
}

main(){
    load_entrypoint_base
    config_nginx
    
    echo "Container processes running..."
    tail -f /dev/null
}
main