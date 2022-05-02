#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

if ! [ -x "$(command -v ansible)" ]; then
  sudo pacman -S ansible --noconfirm
fi

ansible-playbook -K ansible/main.yaml
