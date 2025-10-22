#!/bin/bash
while true; do 

crud_usuarios() {
    echo "                                                         "
    echo "                                                         "
    echo "---- Opciones de usuarios ----"
    echo "1 .Crear usuario"
    echo "2 .Listar usuarios"
    echo "3 .Eliminar usuarios"
    echo "4 .Modificar usuarios"   
   
    echo "                                        "
    read -p "Seleccione una opcion del menu: " opcion
    echo "                                        "

   
    read -p "Seleccione una opcion del menu: " opcion

case $opcion in 
    1)
        source ./useradd.sh
    ;;

    2)
        source ./userlist.sh
    ;;

    3)
        source ./userdel.sh
    ;;

    4)
        source ./usermod.sh
    ;;
    
    
    
    5)break ;;
       *)echo "saliendo al menu principal"; sleep 1
    ;;
    5)break ;; 
        


esac

}

while true; do
crud_ususarios
done
