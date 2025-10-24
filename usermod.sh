#!/bin/bash

 modificar_usuario(){
        read -p "ingresa el nombre del usuario a modificar: " usuario


        if id $usuario &>/dev/null; then
            echo "que quieres modificar?"
            echo "                                "
            echo "1. cambiar el nombre del usuario"
            echo "2. cambiar el directorio de inicio"
            echo "3. cambiar el shell predeterminado"
            echo "                                        "
            read -p "selecciona una sola opcion" opcion

            case $opcion in 

            1)
            read -p "ingresa el nuevo nombre del usuario:" nombre
                echo "                                        "

                sudo usermod -l $nombre $usuario && echo "nuevo nombre de usuario cambiado."
            ;;

            2)
            read -p "ingresa el nuevo directorio de inicio:" directorio
                echo "                                        "

                sudo usermod -d $directorio $usuario && echo "directorio de inicio cambiado."
            ;;

            3)
            read -p "ingresa el nuevo shell predeterminado:" shell
                echo "                                        "

                sudo usermod -s $shell $usuario && echo "shell predeterminado cambiado."
            ;;

            *)
            echo "                                        "

            echo "opcion invalida."
            ;;
            esac
        else
            echo "                                        "

            echo "El usuario $usuario no existe."
        fi  

    }
modificar_usuario