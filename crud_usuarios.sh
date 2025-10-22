#!/bin/bash

crud_ususarios() {
    user_add(){
        echo "ingrese datos para crear un usuario"
        read -p "Ingresa el nombre del nuevo usuario" usuario
        sudo adduser -m $usuario
        sudo passwd $usuario
        echo "usuario $usuario creado correctamente"
    }
user_add

    delete_user(){
        read -p "Ingresa el nombre del usuario a eliminar: " usuario
        if id $usuario &>/dev/null; then
            sudo userdel -r $usuario
            echo "Usuario $usuario eliminado correctamente."
        else
            echo "El usuario $usuario no existe."
        fi  
    }
delete_user 

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

    listar_usuario(){
        echo "lista de los usuarios del sistema:" 
        cut -d: -f1 /etc/passwd
        echo "estos son todos los usuarios del sistema"

}
listar_usuario
}
crud_ususarios