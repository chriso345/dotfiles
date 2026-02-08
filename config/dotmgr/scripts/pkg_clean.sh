#!/usr/bin/env bash

# Add custom scripts to PATH
export PATH="$HOME/.config/dotmgr/scripts:$PATH"

# Get a list of orphaned packages
orphans=$(pacman -Qdtq 2>/dev/null)

# Filter out any packages that no longer exist in repos
valid_orphans=""
for pkg in $orphans; do
  if pacman -Si "$pkg" &>/dev/null || paru -Si "$pkg" &>/dev/null; then
    valid_orphans="$valid_orphans $pkg"
  else
    echo "Skipping missing package: $pkg"
  fi
done

# Remove valid orphaned packages
if [ -n "$valid_orphans" ]; then
  paru -Rns "$valid_orphans" --noconfirm
fi

# Run final script
dotfiles_done.sh
