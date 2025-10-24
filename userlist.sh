#!/bin/bash

 listar_usuario(){
        echo "                                        "
        echo "lista de los usuarios del sistema:" 
        cut -d: -f1 /etc/passwd
        echo "                                        "

        echo "lista de los usuarios del sistema:" 
        cut -d: -f1 /etc/passwd
        echo "estos son todos los usuarios del sistema"

}
listar_usuario

#hola