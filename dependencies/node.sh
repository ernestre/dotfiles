#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

sudo npm install -g \
    instant-markdown-d \
    git-split-diffs \
    intelephense \
    typescript \
    typescript-language-server \
    vscode-langservers-extracted \
    yaml-language-server

