#!/bin/bash
# Script: ver_logs_y_respaldos.sh
# Autor: Antonio Cancela
# Descripción: Muestra logs del sistema y los respaldos realizados

# === RUTAS ===
BACKUP_DIR="/mnt/backup"             # Carpeta donde se guardan los respaldos
LOG_DB="/var/log/backup_db.log"      # Log del backup de base de datos
LOG_REPO="/var/log/backup_repo.log"  # Log del backup del repositorio
SYS_LOG="/var/log/syslog"            # Log general del sistema (puede ser messages)

clear
echo "=============================================="
echo "     🧩 VISOR DE LOGS Y RESPALDOS DEL SISTEMA"
echo "=============================================="
echo

# === LOGS DEL SISTEMA ===
echo "🪵 Últimos 10 eventos del sistema:"
sudo tail -n 10 $SYS_LOG
echo

# === LOG DE BACKUP DE BASE DE DATOS ===
if [ -f "$LOG_DB" ]; then
    echo "💾 Últimas 10 líneas del log de respaldo de la base de datos:"
    tail -n 10 $LOG_DB
else
    echo "⚠️  No existe el log de backup de base de datos ($LOG_DB)"
fi
echo

# === LOG DE BACKUP DEL REPOSITORIO ===
if [ -f "$LOG_REPO" ]; then
    echo "📁 Últimas 10 líneas del log de respaldo del repositorio:"
    tail -n 10 $LOG_REPO
else
    echo "⚠️  No existe el log de backup del repositorio ($LOG_REPO)"
fi
echo

# === LISTAR RESPALDOS EXISTENTES ===
echo "🗂️  Respaldos encontrados en $BACKUP_DIR:"
sudo find $BACKUP_DIR -type f -printf "%TY-%Tm-%Td %TH:%TM %p\n" | sort -r
echo

echo "✅ Fin del reporte."
echo "=============================================="
