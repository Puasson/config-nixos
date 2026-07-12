#!/usr/bin/env bash

set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/Wallpaper"
INTERVAL=600

# Iniciar el daemon si no existe
pgrep -x awww-daemon >/dev/null || {
  awww-daemon &
  sleep 1
}

last_wallpaper=""

while true; do
  # Leer todas las imágenes
  mapfile -t wallpapers < <(
    find "$WALLPAPER_DIR" -type f \
      \( \
      -iname "*.jpg" -o \
      -iname "*.jpeg" -o \
      -iname "*.png" -o \
      -iname "*.webp" \
      \)
  )

  # Si no hay imágenes
  ((${#wallpapers[@]} == 0)) && sleep "$INTERVAL" && continue

  # Elegir una distinta de la anterior
  while :; do
    wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

    [[ "$wallpaper" != "$last_wallpaper" ]] && break

    # Si solo existe una imagen
    ((${#wallpapers[@]} == 1)) && break
  done

  transition=$(shuf -e \
    grow \
    outer \
    wipe \
    wave \
    random \
    any \
    center \
    top \
    bottom \
    left \
    right \
    simple \
    --head-count=1)

  awww img "$wallpaper" \
    --transition-type "$transition" \
    --transition-duration 0.5 \
    --transition-fps 60

  last_wallpaper="$wallpaper"

  sleep "$INTERVAL"
done
