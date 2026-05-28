#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
STATE_DIR="$HOME/.local/state/awww"
ORDER_FILE="$STATE_DIR/order.txt"
LOG_FILE="$STATE_DIR/wallpaper.log"

mkdir -p "$STATE_DIR"

# Create or reload shuffled order if needed
if [[ ! -s "$ORDER_FILE" ]]; then
  find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.webp' \) | shuf >"$ORDER_FILE"
fi

# Read the first wallpaper from the file and remove it from the list
wp=$(head -n 1 "$ORDER_FILE")
if [[ -z "$wp" ]]; then
  # Empty list, reshuffle and use first one
  find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.webp' \) | shuf >"$ORDER_FILE"
  wp=$(head -n 1 "$ORDER_FILE")
fi

# Remove the first line
sed -i '1d' "$ORDER_FILE"

# Log and set wallpaper
echo "$(date): $wp" >>"$LOG_FILE"
awww img "$wp" -t grow --transition-duration 1.5 --transition-pos top-right
