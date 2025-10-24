#!/bin/bash 

crud_directorios() {
    echo "                                                         "
    echo "                                                         "
    echo "---- Opciones de directorios ----"
    echo "1 .Crear directorio"
    echo "2 .Eliminar directorio"
    echo "3 .Listar directorios"
    echo "4 .Modificar directorios"   

    echo "                                        "
    echo "                                        "

    read -p "Seleccione una opcion del menu: " opcion

case $opcion in 
    1)
        source ./diradd.sh
    ;;

    2)
        source ./dirdel.sh
    ;;

    3)
        source ./dirlist.sh
    ;;

    4)
        source ./moddir.sh
    ;;

    5) echo "Volviendo al menú principal..."; sleep 1; ./menu.sh ;;

        


esac

}
while true; do crud_directorios; done

