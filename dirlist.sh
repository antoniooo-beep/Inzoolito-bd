#!/bin/bash

listar_directorios(){
        read -p "Ingresa la ruta del directorio para listar su contenido: " ruta
        if [ -d "$ruta" ]; then
            echo "                                        "           
            echo "Contenido del directorio $ruta:"
            ls -l "$ruta"
        else
            echo "El directorio $ruta no existe."
        fi  
    }   
listar_directorios