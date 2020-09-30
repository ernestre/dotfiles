#!/bin/bash

scriptSource=$(dirname "${BASH_SOURCE[0]}")

bash $scriptSource/installers/dependencies.sh
bash $scriptSource/installers/bat.sh
bash $scriptSource/installers/ctop.sh
bash $scriptSource/installers/go.sh
bash $scriptSource/installers/nodejs.sh

bash $scriptSource/dependencies/node.sh
bash $scriptSource/dependencies/php.sh

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -s --skip-chsh --unattended

[ -d ~/.vim ] || mkdir -v ~/.vim

dir=dotfiles
ln -sv ~/$dir/vim/plugin/ ~/.vim/plugin
ln -sv ~/$dir/vim/ftplugin/ ~/.vim/ftplugin

files=".ctags .gitconfig .gitignore_global .tmux.conf .vimrc .zshrc .config/nvim" # list of files/folders to symlink in homedir
for file in $files; do
    if [ -f ~/$file ]
    then
        rm -rfv ~/$file
    fi

    ln -sv ~/$dir/$file ~/$file
done

# Tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
vim --headless +PlugInstall +qall
