#!/bin/bash

echo "=== Iniciando instalación del sistema de respaldos ==="

echo "[1/6] Verificando carpetas de respaldo..."
sudo mkdir -p /mnt/backup/repos
sudo mkdir -p /mnt/backup

echo "[2/6] Asignando permisos de ejecución..."
chmod +x /home/tony/Inzoolito-bd/*.sh

echo "[3/6] Copiando scripts al /usr/local/bin..."
sudo cp /home/tony/Inzoolito-bd/*.sh /usr/local/bin/

echo "[4/6] Configurando tareas automáticas (crontab)..."

(crontab -l | grep -v 'backup_db.sh' | grep -v 'backup_repo.sh' | grep -v 'backup_git.sh') | crontab -

(crontab -l 2>/dev/null; echo "0 2 * * * /home/tony/Inzoolito-bd/backup_db.sh >> /mnt/backup/backup_db.log 2>&1") | crontab -

(crontab -l 2>/dev/null; echo "0 3 * * * /home/tony/Inzoolito-bd/backup_repo.sh >> /mnt/backup/repos/backup_repo.log 2>&1") | crontab -

(crontab -l 2>/dev/null; echo "0 */6 * * * /home/tony/Inzoolito-bd/backup_git.sh >> /mnt/backup/repos/backup_git.log 2>&1") | crontab -

echo "[5/6] Mostrando tareas automáticas configuradas..."
crontab -l

echo "[6/6] Instalación finalizada correctamente."
echo "Puedes verificar los respaldos en /mnt/backup y los logs en /mnt/backup/repos/"

