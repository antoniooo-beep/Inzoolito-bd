#!/bin/bash

BACKUP_DIR="/mnt/backup"             
LOG_DB="/var/log/backup_db.log"      
LOG_REPO="/var/log/backup_repo.log"  
LOG_GITHUB="/var/log/backup_github.log"  
SYS_LOG="/var/log/syslog"            

clear
echo "=============================================="
echo "      VISOR DE LOGS Y RESPALDOS DEL SISTEMA"
echo "=============================================="
echo

echo " Últimos 10 eventos del sistema:"
sudo tail -n 10 $SYS_LOG
echo

if [ -f "$LOG_DB" ]; then
    echo " Últimas 10 líneas del log de respaldo de la base de datos:"
    tail -n 10 "$LOG_DB"
else
    echo "  No existe el log de backup de base de datos ($LOG_DB)"
fi
echo

if [ -f "$LOG_REPO" ]; then
    echo " Últimas 10 líneas del log de respaldo del repositorio:"
    tail -n 10 "$LOG_REPO"
else
    echo "  No existe el log de backup del repositorio ($LOG_REPO)"
fi
echo

if [ -f "$LOG_GITHUB" ]; then
    echo " Últimas 10 líneas del log de respaldo de GitHub:"
    tail -n 10 "$LOG_GITHUB"
else
    echo "  No existe el log de backup de GitHub ($LOG_GITHUB)"
fi
echo

echo "  Respaldos encontrados en $BACKUP_DIR:"
sudo find "$BACKUP_DIR" -type f -printf "%TY-%Tm-%Td %TH:%TM %p\n" | sort -r
echo

echo " Fin del log.sh"
echo "=============================================="
