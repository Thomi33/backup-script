#!/bin/bash
# backup.sh - Integrantes: Thomi, [Nombre 2], [Nombre 3]  Grupo: [Grupo]
echo "Backup - Integrantes: Thomi, [Nombre 2], [Nombre 3] - $(date)"
if [ $# -eq 0 ]; then
    echo "Error: no se recibieron carpetas. Uso: $0 carpeta1 [carpeta2 ...]"
    exit 1
fi
DESTINO=$HOME/entrega/backups
mkdir -p "$DESTINO"
FECHA=$(date +%Y%m%d_%H%M%S)
ERRORS=0
for CARPETA in "$@"; do
    if [ -d "$CARPETA" ]; then
        ARCHIVO="$DESTINO/backup_$(basename "$CARPETA")_$FECHA.tar.gz"
        if tar -czf "$ARCHIVO" -C "$(dirname "$CARPETA")" "$(basename "$CARPETA")"; then
            ARCHIVOS=$(tar -tzf "$ARCHIVO" | wc -l)
            echo "OK: $CARPETA -> $ARCHIVO ($ARCHIVOS archivos)"
        else
            echo "ERROR: no se pudo comprimir $CARPETA"
            ERRORS=$((ERRORS + 1))
        fi
    else
        echo "ERROR: la carpeta $CARPETA no existe"
        ERRORS=$((ERRORS + 1))
    fi
done
if [ $ERRORS -gt 0 ]; then
    echo "Terminé con $ERRORS errores."
    exit 1
fi
echo "Backup completado sin problemas."
exit 0
# crontab: todos los días a las 22:00
# 0 22 * * * /home/thomi/entrega/backup.sh /home/thomi/proyectos /home/thomi/entrega
