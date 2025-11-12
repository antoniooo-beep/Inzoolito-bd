#!/bin/bash

user_add() {
    echo "==============================================="
    echo " Ingrese datos para crear un usuario"
    echo "==============================================="
    echo
    read -p " Ingresa el nombre del nuevo usuario: " usuario

    sudo adduser -m "$usuario"
    
    sudo passwd "$usuario"

    echo
    echo " Usuario '$usuario' creado correctamente."
}

user_add
