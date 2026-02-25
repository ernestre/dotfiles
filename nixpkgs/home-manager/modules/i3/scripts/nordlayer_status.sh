#!/bin/bash

status=$(nordlayer status --silent 2>/dev/null)

if echo "$status" | grep -q "VPN: Connected"; then
    gateway=$(echo "$status" | grep "Gateway:" | cut -d: -f2 | xargs)
    echo "{\"state\":\"Good\",\"text\":\"󰕥 $gateway\"}"
else
    echo "{\"state\":\"Critical\",\"text\":\"󰕑 VPN Disconnected\"}"
fi
