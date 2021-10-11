#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

sudo apt-get update -qq

sudo DEBIAN_FRONTEND=noninteractive apt-get install -yqq \
    autorandr \
    curl \
    fd-find \
    fzf \
    git \
    mycli \
    pass \
    php7.4-curl \
    php7.4-dom \
    php7.4-fpm \
    php7.4-intl \
    php7.4-mbstring \
    polybar \
    ripgrep \
    tmux \
    zathura \
    zsh
