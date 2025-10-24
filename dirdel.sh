#!/bin/bash

eliminar_directorio(){
        read -p "Ingresa la ruta del directorio a eliminar: " ruta
        read -p "Ingresa el nombre del directorio a eliminar: " nombre
        if [ -d "$ruta/$nombre" ]; then
            sudo rm -r "$ruta/$nombre"
            echo "Directorio $nombre eliminado de $ruta correctamente."
        else
            echo "El directorio $nombre no existe en $ruta."
        fi  
    }
eliminar_directorio