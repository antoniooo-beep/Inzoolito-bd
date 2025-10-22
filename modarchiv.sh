#!/bin/bash

modarchiv(){
        echo "                                        "
        read -p "Ingresa la ruta del archivo a modificar: " ruta
        echo "                                        "
        read -p "Ingresa el nombre del archivo a modificar: " nombre

        if [ -f "$ruta/$nombre" ]; then
            echo "                                        "
            echo "¿Qué deseas modificar?"
            echo "1. Cambiar el nombre del archivo"
            echo "2. Mover el archivo a otra ubicación"
            echo "                                        "

            read -p "Selecciona una opción: " opcion

            case $opcion in 
            1)
                read -p "Ingresa el nuevo nombre del archivo: " nuevo_nombre
                echo "                                        "
                sudo mv "$ruta/$nombre" "$ruta/$nuevo_nombre" && echo "Nombre del archivo cambiado a $nuevo_nombre."
            ;;
            2)
                read -p "Ingresa la nueva ruta para mover el archivo: " nueva_ruta
                echo "                                        "
                sudo mv "$ruta/$nombre" "$nueva_ruta/" && echo "Archivo movido a $nueva_ruta."
            ;;
            *)
                echo "Opción inválida."
            ;;
            esac
        else
            echo "                                        "
            echo "El archivo $nombre no existe en $ruta."
        fi  
    }
modarchiv()