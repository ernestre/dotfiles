#!/usr/bin/env bash

sudo apt-get update -qq

sudo DEBIAN_FRONTEND=noninteractive apt-get install -yqq \
    curl \
    fzf \
    git \
    mycli \
    pass \
    php7.4-curl \
    php7.4-dom \
    php7.4-fpm \
    php7.4-mbstring \
    ripgrep \
    tmux \
    zsh

sudo snap install --edge nvim --classic
