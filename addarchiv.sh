#!/bin/bash

addarchiv(){
        echo "                                        "
        read -p "Ingresa la ruta donde deseas crear el archivo: " ruta
        echo "                                        "
        read -p "Ingresa el nombre del archivo a crear: " nombre

        if [ -d "$ruta" ]; then
            sudo touch "$ruta/$nombre" && echo "Archivo $nombre creado exitosamente en $ruta."
        else
            echo "                                        "
            echo "La ruta $ruta no existe."
        fi  
    }
addarchiv