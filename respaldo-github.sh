#!/bin/bash

REPO_URL="https://github.com/antoniooo-beep/Inzoolito-bd.git"
DEST_DIR="/home/antonio/backups/repos"
DATE=$(date +%Y%m%d_%H%M)
REPO_NAME="Inzoolito-bd"

if [ ! -d "$DEST_DIR/$REPO_NAME" ]; then
    git clone "$REPO_URL" "$DEST_DIR/$REPO_NAME"
else
    cd "$DEST_DIR/$REPO_NAME" || exit
    git pull origin main
fi

cd "$DEST_DIR" || exit
tar -czf "${REPO_NAME}_backup_${DATE}.tar.gz" "$REPO_NAME"

find "$DEST_DIR" -name "*.tar.gz" -type f -mtime +7 -delete

echo "✅ Backup completado el $DATE"
