#!/bin/bash 

 crear_directorio(){
        read -p "Ingresa la ruta donde deseas crear el directorio: " ruta
        read -p "Ingresa el nombre del nuevo directorio: " nombre
        sudo mkdir -p "$ruta/$nombre"
        echo "Directorio $nombre creado en $ruta correctamente."
    }
crear_directorio