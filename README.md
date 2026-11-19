# Backup Script

Script de backup en bash para el trabajo final de la Unidad 3 — Sistemas Operativos, 2.º BT TI.

## Qué hace

Recibe una o más carpetas por parámetro y las comprime en archivos `.tar.gz` con nombre y fecha automáticos en `~/entrega/backups/`.

## Uso

```bash
./backup.sh carpeta1 [carpeta2 ...]
```

Ejemplo:

```bash
./backup.sh /home/thomi/proyectos /home/thomi/entrega
```

## Requisitos

- Linux (bash)
- `tar` (incluido en cualquier distro)

## Instalación

1. Clona el repositorio:
   ```bash
   git clone https://github.com/Thomi33/backup-script.git
   cd backup-script
   ```
2. Hazlo ejecutable:
   ```bash
   chmod +x backup.sh
   ```
3. Ejecútalo:
   ```bash
   ./backup.sh <carpeta1> [carpeta2 ...]
   ```

## Cron (opcional)

Para ejecutarlo todos los días a las 22:00:

```bash
crontab -e
# Agrega:
0 22 * * * /ruta/a/backup.sh /ruta/a/carpeta1 /ruta/a/carpeta2
```

## Salida

- `exit 0` → todo bien
- `exit 1` → error (sin argumentos, carpeta inexistente, o falló la compresión)
# Proyecto-Backup-Linux
