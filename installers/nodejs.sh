#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if command -v node &> /dev/null
then
    echo "nodejs already installed: $(node -v)"
    exit 0
fi

echo "Installing nodejs LTS version"

curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -yqq nodejs
