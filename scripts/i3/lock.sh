#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

playerctl pause
i3lock -t -i ~/dotfiles/wallpapers/main.png ; # systemctl suspend
