#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

log() {
    echo "[$( date +'%Y-%m-%d %H:%M:%S')] $1"
}

logInstall() {
    log "Installing $1"
}

scriptSource=$(dirname "${BASH_SOURCE[0]}")

logInstall "dependencies"
bash $scriptSource/installers/dependencies.sh
logInstall "ctop"
bash $scriptSource/installers/ctop.sh
logInstall "go"
bash $scriptSource/installers/go.sh
logInstall "nodejs"
bash $scriptSource/installers/nodejs.sh
logInstall "nvim"
bash $scriptSource/installers/nvim.sh

logInstall "node dependencies"
bash $scriptSource/dependencies/node.sh
logInstall "php dependencies"
bash $scriptSource/dependencies/php.sh

log "Symlinking .config dir"
bash $scriptSource/installers/configs.sh

logInstall "ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -s --skip-chsh --unattended

logInstall "tmux plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

logInstall "vimplug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

logInstall "vim plugins"
nvim --headless +PlugInstall +qall
