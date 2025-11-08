#!/bin/bash

#!/bin/bash

# ==== CONFIGURACIÓN ====
# Ruta donde se guardará el respaldo
DESTINO="/mnt/backup/repos"

# URL del repositorio de GitHub
REPO_URL="https://github.com/antoniooo-beep/Inzoolito-bd.git"

# Nombre del proyecto (sin espacios)
PROYECTO="Inzoolito-bd"

# Fecha actual
FECHA=$(date +%Y-%m-%d_%H-%M)

# ==== PROCESO ====
echo "==== Iniciando respaldo del repositorio $PROYECTO ===="

# Si ya existe una copia local, actualízala
if [ -d "$DESTINO/$PROYECTO" ]; then
    cd "$DESTINO/$PROYECTO"
    git pull origin main
else
    cd "$DESTINO"
    git clone "$REPO_URL"
fi

# Crear un archivo comprimido con fecha
cd "$DESTINO"
tar -czf "${PROYECTO}_$FECHA.tar.gz" "$PROYECTO"

# ==== FIN ====
echo "Respaldo completado: ${DESTINO}/${PROYECTO}_$FECHA.tar.gz"
