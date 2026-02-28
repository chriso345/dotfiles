#!/usr/bin/env bash

THEMES_PATH="$HOME/.config/dotmgr/themes"
CURRENT_FILE="$THEMES_PATH/_current/current.txt"
PAPER_FILE="$THEMES_PATH/_current/paper.conf"

# Read the current theme
if [[ ! -f "$CURRENT_FILE" ]]; then
  echo "Error: $CURRENT_FILE not found"
  exit 1
fi
current_theme=$(<"$CURRENT_FILE")

# Read the current wallpaper path from paper.conf
if [[ -f "$PAPER_FILE" ]]; then
  # Extract the path value from the wallpaper block
  current_wallpaper=$(grep -oP 'path\s*=\s*\K.+' "$PAPER_FILE")
  current_wallpaper=$(basename "$current_wallpaper")
else
  current_wallpaper=""
fi

# List all wallpapers in the current theme
wallpapers=("$THEMES_PATH/$current_theme/walls/"*)
for paper in "${wallpapers[@]}"; do
  paper_name=$(basename "$paper")

  echo "[[items]]"
  echo "label = \"$paper_name\""
  echo "exec = \"$HOME/.config/dotmgr/scripts/wallpaper_change.sh '$paper'\""
  if [[ "$paper_name" == "$current_wallpaper" ]]; then
    echo "active = true"
  fi

  echo ""
done
