#!/bin/bash 


crud_archivos() {
    echo "                                                         "
    echo "                                                         "
    echo "---- Opciones de archivos ----"
    echo "1 .Crear archivo"
    echo "2 .Eliminar archivo"
    echo "3 .Listar archivos"
    echo "4 .Modificar archivos"   

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
    
    
    
    5)break ;; 
        *)echo "saliendo al menu principal"; sleep 1 ;;
        


esac

}
while true; do 
crud_archivos()
done