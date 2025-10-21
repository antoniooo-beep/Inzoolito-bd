#!/bin/bash
# install_innzzolito.sh

echo "=== Instalación de herramientas necesarias ==="
sudo apt update && sudo apt install -y nftables tar iproute2

echo "=== Creando script de operador ==="
sudo tee /usr/local/bin/operador.sh > /dev/null <<'EOF'
#!/bin/bash
echo "===== MENU OPERADOR ====="
echo "1) Servicios"
echo "2) Red"
echo "3) Procesos"
echo "4) Respaldos"
echo "5) Usuarios"
echo "6) Registros"
echo "0) Salir"
echo "========================="
read -p "Elija una opción: " op

case $op in
  1)
    echo "=== Servicios ==="
    echo "1) Ver estado de un servicio"
    echo "2) Iniciar un servicio"
    echo "3) Detener un servicio"
    read -p "Opción: " svcop
    read -p "Nombre del servicio: " svc
    case $svcop in
      1) systemctl status $svc ;;
      2) sudo systemctl start $svc ;;
      3) sudo systemctl stop $svc ;;
    esac
    ;;
  2)
    echo "=== Red ==="
    ip a
    ;;
  3)
    echo "=== Procesos ==="
    ps aux | head -n 15
    read -p "Ingrese PID a terminar (o Enter para no hacer nada): " pid
    if [ ! -z "$pid" ]; then
      kill -9 $pid
      echo "Proceso $pid terminado."
    fi
    ;;
  4)
    echo "=== Respaldos ==="
    read -p "Carpeta origen: " src
    read -p "Carpeta destino: " dst
    mkdir -p $dst
    cp -r $src $dst
    echo "Respaldo copiado en $dst"
    ;;
  5)
    echo "=== Usuarios ==="
    echo "1) Listar usuarios"
    echo "2) Crear usuario"
    echo "3) Borrar usuario"
    read -p "Opción: " uop
    case $uop in
      1) cut -d: -f1 /etc/passwd ;;
      2) read -p "Nombre nuevo usuario: " newu
         sudo useradd -m $newu
         echo "Usuario $newu creado."
         ;;
      3) read -p "Usuario a borrar: " delu
         sudo userdel -r $delu
         echo "Usuario $delu eliminado."
         ;;
    esac
    ;;
  6)
    echo "=== Registros ==="
    tar -czf logs.tar.gz /var/log/*
    echo "Logs comprimidos en logs.tar.gz"
    ;;
  0)
    echo "Saliendo..."
    ;;
  *)
    echo "Opción inválida"
    ;;
esac
EOF

sudo chmod +x /usr/local/bin/operador.sh

echo "=== Configurando nftables ==="
sudo tee /etc/nftables.conf > /dev/null <<'EOF'
table inet reglas_innzzolito {
    chain input {
        type filter hook input priority 0;
        iif "lo" accept
        ct state established,related accept
        tcp dport 22 accept
        tcp dport 80 accept
        tcp dport 443 accept
        ip saddr 192.168.1.100 tcp dport 3306 accept
        counter drop
    }

    chain forward {
        type filter hook forward priority 0;
        drop
    }

    chain output {
        type filter hook output priority 0;
        accept
    }
}
EOF

sudo systemctl enable nftables
sudo systemctl restart nftables

echo "=== Instalación completada ==="
echo "Ejecute el operador con: operador.sh"
