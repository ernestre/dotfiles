#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause
i3lock -c 000000; # systemctl suspend
