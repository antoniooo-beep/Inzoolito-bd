#!/bin/bash 

 crear_directorio(){
        read -p "Ingresa la ruta donde deseas crear el directorio: " ruta
        echo "                                        "
        read -p "Ingresa el nombre del nuevo directorio: " nombre
        sudo mkdir -p "$ruta/$nombre"
        echo "                                        "
        echo "Directorio $nombre creado en $ruta correctamente."
    }
crear_directorio