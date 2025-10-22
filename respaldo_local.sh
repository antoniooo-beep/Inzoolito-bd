#!/bin/bash
ORIGEN=“/home/usuario/datos_restaurante”
DESTINO=“/home/usuario/datos_backup”
LOG=“/var/log/respaldo_local.log”
FECHA=$(date +%F)
ARCHIVO="respaldo_local_$FECHA.tar.gz"
TMPDIR="/tmp/respaldo_$FECHA"
mkdir -p "$TMPDIR"
mysqldump -u root -proot123 Proyecto > "$TMPDIR/db.sql"
cp -r "$ORIGEN" "$TMPDIR/"
mkdir -p "$DESTINO"
tar czf "$DESTINO/$ARCHIVO" -C /tmp "respaldo_$FECHA"
rm -rf "$TMPDIR"
echo “Respaldo local realizado el $(date) y generado en $DESTINO/$ARCHIVO” >> “$LOG”
