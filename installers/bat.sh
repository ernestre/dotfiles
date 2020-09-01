#!/usr/bin/env bash

if command -v bat &> /dev/null
then
    echo "Bat already installed: $(bat -V)"
    exit 0
fi

VERSION='0.15.4'
TMP_INSTALL_DIR=/tmp/bat

[ -d TMP_INSTALL_DIR ] || mkdir -p /tmp/bat

echo "Downloading bat v$VERSION"
curl -Lso $TMP_INSTALL_DIR/bat_$VERSION\_amd64.deb https://github.com/sharkdp/bat/releases/download/v$VERSION/bat_$VERSION\_amd64.deb
sudo apt-get -qq install $TMP_INSTALL_DIR/bat_$VERSION\_amd64.deb > /dev/null

rm -rf $TMP_INSTALL_DIR

exit 0
