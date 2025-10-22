#!/bin/bash

 user_add(){
        echo "ingrese datos para crear un usuario"
        read -p "Ingresa el nombre del nuevo usuario" usuario
        sudo adduser -m $usuario
        sudo passwd $usuario
        echo "usuario $usuario creado correctamente"
    }
user_add