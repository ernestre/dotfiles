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

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -s --skip-chsh --unattended

[ -d ~/.vim ] || mkdir -v ~/.vim
[ -d ~/.config ] || mkdir -v ~/.config

dir=dotfiles
ln -sv ~/$dir/vim/plugin/ ~/.vim/plugin
ln -sv ~/$dir/vim/ftplugin/ ~/.vim/ftplugin
ln -sv ~/$dir/vim/after/ ~/.vim/after

# list of files/folders to symlink in homedir
files=(".gitconfig" ".gitignore_global" ".tmux.conf" ".vimrc" ".zshrc" ".config/nvim" ".config/kitty" ".config/i3")
for file in ${files[@]}; do
    ln -svf ~/$dir/$file ~/$file
done

# Tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
nvim --headless +PlugInstall +qall
