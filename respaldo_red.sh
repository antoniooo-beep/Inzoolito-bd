#!/bin/bash
ORIGEN=”/home/usuario/datos_restaurante”
DESTINO=”/mnt/nas_backup”
LOG=”/var/log/respaldo_red.log”
FECHA=$(date +%F)
ARCHIVO="respaldo_red_$FECHA.tar.gz"
TMPDIR="/tmp/respaldo_red_$FECHA"
mkdir -p "$TMPDIR"
mysqldump -u root -proot123 Proyecto > "$TMPDIR/db.sql"
cp -r "$ORIGEN" "$TMPDIR/"
mkdir -p "$DESTINO"
tar czf "$DESTINO/$ARCHIVO" -C /tmp "respaldo_red_$FECHA"
rm -rf "$TMPDIR"
echo “Respaldo en red realizado el $(date) y generado en $DESTINO/$ARCHIVO” >> “$LOG”
