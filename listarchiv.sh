#!/bin/bash

listarchiv(){
        echo "                                        "
        read -p "Ingresa la ruta del directorio para listar archivos: " ruta
        echo "                                        "

        if [ -d "$ruta" ]; then
            echo "Archivos en $ruta:"
            ls -l "$ruta"
        else
            echo "                                        "
            echo "La ruta $ruta no existe."
        fi  
    }
listarchiv()