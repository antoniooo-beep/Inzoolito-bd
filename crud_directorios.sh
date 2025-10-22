#!/bin/bash 

crud_directorios() {
    crear_directorio(){
        read -p "Ingresa la ruta donde deseas crear el directorio: " ruta
        read -p "Ingresa el nombre del nuevo directorio: " nombre
        sudo mkdir -p "$ruta/$nombre"
        echo "Directorio $nombre creado en $ruta correctamente."
    }
crear_directorio

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

    modificar_directorio(){
        read -p "Ingresa la ruta del directorio a modificar: " ruta
        read -p "Ingresa el nombre del directorio a modificar: " nombre

        if [ -d "$ruta/$nombre" ]; then
            echo "¿Qué deseas modificar?"
            echo "1. Cambiar el nombre del directorio"
            echo "2. Mover el directorio a otra ubicación"
            read -p "Selecciona una opción: " opcion

            case $opcion in 
            1)
                read -p "Ingresa el nuevo nombre del directorio: " nuevo_nombre
                sudo mv "$ruta/$nombre" "$ruta/$nuevo_nombre" && echo "Nombre del directorio cambiado a $nuevo_nombre."
            ;;
            2)
                read -p "Ingresa la nueva ruta para mover el directorio: " nueva_ruta
                sudo mv "$ruta/$nombre" "$nueva_ruta/" && echo "Directorio movido a $nueva_ruta."
            ;;
            *)
                echo "Opción inválida."
            ;;
            esac
        else
            echo "El directorio $nombre no existe en $ruta."
        fi  

    }
modificar_directorio

    listar_directorios(){
        read -p "Ingresa la ruta del directorio para listar su contenido: " ruta
        if [ -d "$ruta" ]; then
            echo "Contenido del directorio $ruta:"
            ls -l "$ruta"
        else
            echo "El directorio $ruta no existe."
        fi  
    }   
listar_directorios
}   

