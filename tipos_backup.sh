#!/bin/bash
tipos_backup() {
    echo "                                                         "
    echo "                                                         "
    echo "---- Tipos de backups ----"
    echo "1 .Respaldo base de datos"
    echo "2 .Respaldo del programa"
    echo "3 .salir al menu principal"
   
    
    echo "                                        "
    echo "                                         "
   
    read -p "Seleccione una opcion del menu: " opcion

case $opcion in 
    1)
        source ./respaldo-bdd.sh
    ;;

    2)
        source ./respaldo-programa.sh
    ;;

    3) echo "Volviendo al menú principal..."; sleep 1; /home/tony/menu.sh ;;


    
 

    
        


esac

}
while true; do tipos_backup; done






