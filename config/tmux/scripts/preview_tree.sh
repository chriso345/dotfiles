#!/usr/bin/env bash

tree() {
  if command -v eza >/dev/null 2>&1; then
    eza --tree --icons --group-directories-first "$@"
  elif command -v tree >/dev/null 2>&1; then
    tree "$@"
  else
    ls -R "$@"
  fi
}
