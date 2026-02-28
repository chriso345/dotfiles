#!/usr/bin/env bash

THEMES_PATH="$HOME/.config/dotmgr/themes"
current_file="$THEMES_PATH/_current/current.txt"

# Read the current theme
if [[ ! -f "$current_file" ]]; then
  echo "Error: $current_file not found"
  exit 1
fi
current_theme=$(<"$current_file")

for dir in "$THEMES_PATH"/*/; do
  dir_name=$(basename "$dir")
  [[ "$dir_name" == "_current" ]] && continue

  theme_name="$dir_name"
  tidy=$(echo "$theme_name" | tr '_' ' ' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')

  echo "[[items]]"
  echo "label = \"$tidy\""
  echo "exec = \"$HOME/.config/dotmgr/scripts/theme_change.sh $theme_name\""
  echo "visible = false"

  # Add active = true if this is the current theme
  if [[ "$theme_name" == "$current_theme" ]]; then
    echo "active = true"
  fi

  echo ""
done
