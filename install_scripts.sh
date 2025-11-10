#!/bin/bash


echo "=== Iniciando instalación del sistema de respaldos ==="

echo "[1/5] Verificando carpetas de respaldo..."
sudo mkdir -p /mnt/backup/repos
sudo mkdir -p /mnt/backup

echo "[2/5] Asignando permisos de ejecución..."
chmod +x /home/tony/Inzoolito-bd/*.sh

echo "[3/5] Copiando scripts al /usr/local/bin..."
sudo cp /home/tony/Inzoolito-bd/*.sh /usr/local/bin/

echo "[4/5] Configurando tareas automáticas (crontab)..."

(crontab -l | grep -v 'backup_db.sh' | grep -v 'backup_repo.sh') | crontab -

(crontab -l 2>/dev/null; echo "0 2 * * * /home/tony/Inzoolito-bd/backup_db.sh >> /mnt/backup/backup_db.log 2>&1") | crontab -
(crontab -l 2>/dev/null; echo "0 3 * * * /home/tony/Inzoolito-bd/backup_repo.sh >> /mnt/backup/repos/backup_repo.log 2>&1") | crontab -

echo "[5/5] Instalación finalizada correctamente."
echo "Puedes verificar las tareas automáticas con: crontab -l"
