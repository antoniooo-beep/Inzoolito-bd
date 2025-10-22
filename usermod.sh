#!/bin/bash

 modificar_usuario(){
        read -p "ingresa el nombre del usuario a modificar: " usuario


        if id $usuario &>/dev/null; then
            echo "que quieres modificar?"
            echo "1. cambiar el nombre del usuario"
            echo "2. cambiar el directorio de inicio"
            echo "3. cambiar el shell predeterminado"
            read -p "selecciona una sola opcion" opcion

            case $opcion in 

            1)
            read -p "ingresa el nuevo nombre del usuario:" nombre
                sudo usermod -l $nombre $usuario && echo "nuevo nombre de usuario cambiado."
            ;;

            2)
            read -p "ingresa el nuevo directorio de inicio:" directorio
                sudo usermod -d $directorio $usuario && echo "directorio de inicio cambiado."
            ;;

            3)
            read -p "ingresa el nuevo shell predeterminado:" shell
                sudo usermod -s $shell $usuario && echo "shell predeterminado cambiado."
            ;;

            *)
            echo "opcion invalida."
            ;;
            esac
        else
            echo "El usuario $usuario no existe."
        fi  

    }
modificar_usuario