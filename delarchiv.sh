#!/bin/bash

delarchiv(){
        echo "                                        "
        read -p "Ingresa la ruta del archivo a eliminar: " ruta
        echo "                                        "
        read -p "Ingresa el nombre del archivo a eliminar: " nombre

        if [ -f "$ruta/$nombre" ]; then
            echo "                                        "
            read -p "¿Estás seguro de que deseas eliminar el archivo $nombre? (s/n): " confirmacion
            echo "                                        "

            if [[ "$confirmacion" == "s" || "$confirmacion" == "S" ]]; then
                sudo rm "$ruta/$nombre" && echo "Archivo $nombre eliminado exitosamente."
            else
                echo "Eliminación cancelada."
            fi
        else
            echo "                                        "
            echo "El archivo $nombre no existe en $ruta."
        fi  
    }
delarchiv()