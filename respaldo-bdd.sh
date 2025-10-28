#!/bin/bash

backup_dbs="Segundaentrega.sql"

# Where to backup to.
dest="/respaldos"

# Create archive filename.
day=$(date +%A)
archive_file="mysql-$day.sql.gz"

# Print start status message.
echo "Backing up $backup_dbs to $dest/$archive_file"
date
echo

mysqldump --defaults-extra-file=/root/.my.cnf --skip-comments --add-drop-table --databases $backup_dbs | gzip -9 > $dest/$archive_file

echo
echo "Backup finished"
date