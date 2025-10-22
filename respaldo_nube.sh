#!/bin/bash
# Carpeta local que se quiere respaldar, puede ser cualquiera de las dos
ORIGEN=”/home/usuarios/datos restaurante” 
ORIGEN=”/mnt/nas_backup”
BUCKET=”s3://nombrebucket”
LOG=”/var/log/respaldo_nube.log”
FECHA=$(date +%F)
ARCHIVO="respaldo_nube_$FECHA.tar.gz"
TMPDIR="/tmp/respaldo_nube_$FECHA"
mkdir -p "$TMPDIR"
mysqldump -u root -proot123 Proyecto > "$TMPDIR/db.sql"
cp -r "$ORIGEN" "$TMPDIR/"
tar czf "/tmp/$ARCHIVO" -C /tmp "respaldo_nube_$FECHA"
aws s3 cp "/tmp/$ARCHIVO" "$BUCKET/"
rm -rf "$TMPDIR" "/tmp/$ARCHIVO"
echo “Respaldo en la nube realizado el $(date) y subido a $BUCKET/$ARCHIVO” >> “$LOG”
