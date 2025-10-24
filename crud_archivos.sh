#!/bin/bash 

crud_archivos() {
    echo "                                                         "
    echo "                                                         "
    echo "---- Opciones de archivos ----"
    echo "1 .Crear archivo"
    echo "2 .Eliminar archivo"
    echo "3 .Listar archivos"
    echo "4 .Modificar archivos"   
    echo "5 .Salir al menu principal"

    echo "                                        "
    echo "                                        "

    read -p "Seleccione una opcion del menu: " opcion

case $opcion in 
    1)
        source ./addarchiv.sh
    ;;

    2)
        source ./delarchiv.sh
    ;;

    3)
        source ./listarchiv.sh
    ;;

    4)
        source ./modarchiv.sh
    ;;
    
    5) echo "Volviendo al menú principal..."; sleep 1; ./menu.sh ;;
        


esac

}
while true; do crud_archivos; done
