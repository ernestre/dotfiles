#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause
playerctl pause
i3lock -t -i ~/dotfiles/wallpapers/main.png ; # systemctl suspend
