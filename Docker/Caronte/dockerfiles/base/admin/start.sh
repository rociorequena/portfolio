config_ssh(){
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
    if [ ! -d /home/${USUARIO}/.ssh ]; 
    then
        mkdir /home/${USUARIO}/.ssh
        cat /root/datos/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys

    fi
    # /etc/init.d/ssh start &
    #exec /usr/sbin/sshd -D & #dejar el ssh en background (2plano)
}

#rocio ALL=(ALL:ALL) ALL
config_sudoer(){
    if [ -f /etc/sudoers]
    then
    #comprobar que el ${USUARIO} no existe
        echo "${USUARIO} ALL=(ALL:ALL) ALL" >> /etc/sudoers
    fi
}

#!/bin/bash
# carga las variables de entono pasadas desde el D.Compose
set -e

source /root/admin/base/usuarios/mainUsuarios.sh
source /root/admin/base/ssh/mainssh.sh

# source /root/admin/base/usuarios/makeUsuariosPostgress

main() {
    # gestion usuario ---> getsUser.sh
    # gestion del sudo ---> gestSudo.sh
    # gestion del ssh ---> gestSsh.sh
    # ...
    touch /root/logs/informe.log
    newUser
    # if [ "$?" -eq 0 ]
    # then
    #     make_ssh
    # fi

    # encargada de dejar este contendor vivo en BGround
    tail -f /dev/null
    ## script's que se encargar de configurar el imagen/contenedor
}

main