#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause
i3lock -i ~/dotfiles/wallpapers/main.png ; # systemctl suspend
