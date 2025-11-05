#!/bin/bash

newUser(){
useradd -rm -d /home/rocio -s /bin/bash rocio
echo "rocio:1234" | chpasswd 
echo "Bienvenida Rocio!"> /home/rocio/bienvenida.txt
}

main(){
    newUser
tail -f /dev/null
## script's que se encargan de configurar el contenedor y la imagen.
}

main
