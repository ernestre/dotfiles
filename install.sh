#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles          # dotfiles directory
olddir=~/dotfiles_old   # old dotfiles backup directory
files="vimrc tmux.conf ctags gitconfig gitignore_global zshrc" # list of files/folders to symlink in homedir

##########

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

echo "Changing to the $dir directory"
cd $dir
echo "...done"

echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    if [ -f ~/.$file  ]; then
        mv ~/.$file $olddir
        echo $file "moved to" $olddir
    fi
done
echo "...done"

echo "Creating symlinks"
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file ~/.$file
done
echo "...done"

echo "Installing TPM"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "...done"

echo "Installing Tmux plugins"
~/.tmux/plugins/tpm/bin/install_plugins
echo "...done"

echo "Installing FZF"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "...done"

echo "Installing Plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "...Done"

echo "Installing Vim plugins"
vim +PlugInstall +qall
echo "...Done"
