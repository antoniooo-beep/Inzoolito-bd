#!/bin/bash

delete_user(){
        echo "                                        "
        read -p "Ingresa el nombre del usuario a eliminar: " usuario
        if id $usuario &>/dev/null; then
            sudo userdel -r $usuario
            echo "                                        "
            echo "Usuario $usuario eliminado correctamente."
        else
            echo "                                        "
            echo "El usuario $usuario no existe."
        fi  
    }
delete_user 