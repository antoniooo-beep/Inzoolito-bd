#!/bin/bash
tipos_backup() {
    echo "                                                         "
    echo "                                                         "
    echo "---- Tipos de backups ----"
    echo "1 .Respaldo local"
    echo "2 .Respaldo de red"
    echo "3 .Respaldo en la nube"
    echo "4 .Salir al menu principal"
    
    echo "                                        "
    echo "                                        "
   
    read -p "Seleccione una opcion del menu: " opcion

case $opcion in 
    1)
        source ./respaldo_local.sh
    ;;

    2)
        source ./respaldo_red.sh
    ;;

    3)
        source ./respaldo_nube.sh
    ;;

    4) echo "Volviendo al menú principal..."; sleep 1; ./menu.sh ;;
 

    
        


esac

}
while true; do tipos_backup; done






