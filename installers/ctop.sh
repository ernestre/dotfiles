#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

if command -v ctop &> /dev/null
then
    echo "ctop already installed: $(ctop -v)"
    exit 0
fi

VERSION='0.7.3'
echo "Downloading ctop v$VERSION"
sudo curl -Lso /usr/local/bin/ctop https://github.com/bcicen/ctop/releases/download/v$VERSION/ctop-$VERSION-linux-amd64
sudo chmod +x /usr/local/bin/ctop

exit 0
