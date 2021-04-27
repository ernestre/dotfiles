#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

sudo DEBIAN_FRONTEND=noninteractive apt-get install -yqq \
    ninja-build \
    gettext \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    pkg-config \
    unzip \


currentDir=$PWD

cd /tmp

git clone https://github.com/neovim/neovim.git
cd neovim

make CMAKE_BUILD_TYPE=Release
sudo make install

cd $currentDir
