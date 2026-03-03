#!/bin/bash

status=$(nordlayer status --silent 2>/dev/null)
gwFileLocation=~/.config/nordlayer/gw

if [[ ! -s ${gwFileLocation} ]]; then
    echo "Gateway file is missing at ${gwFileLocation}"
    exit 1
fi

gw=$(cat $gwFileLocation)

if echo "$status" | grep -q "VPN: Connected"; then
    notify-send "Disconnecting from $gw"
    nordlayer disconnect $gw
else
    notify-send "Connecting to $gw"
    nordlayer connect $gw
fi
