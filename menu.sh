#!/bin/bash

menu_add() {
    echo "                                                         "
    echo "                                                         "
    echo "---- Menu de manejo del sistema ----"
    echo "1 .Opciones de directorios"
    echo "2 .Opciones de archivos"
    echo "3 .Opciones de usuarios"
    echo "4 .Opciones de backup"
    echo "5 .Opciones de restauracion de servicio"
    echo "6 .Ver log del sistema y backups"
    echo "7 .Ver configuraciones activas"
    echo "8 .Salir del menu"   
   
   
    read -p "Seleccione una opcion del menu: " opcion

case $opcion in 
    1)
        source ./crud_directorios.sh
    ;;

    2)
        source ./crud_archivos.sh
    ;;

    3)
        source ./crud_usuarios.sh
    ;;

    4)
        source ./tipos_backup.sh
    ;;

    8)
        echo "Saliendo del sistema..."
        sleep 1
        clear
        exit
    ;;




    



esac

}
while true; do
menu_add
done

