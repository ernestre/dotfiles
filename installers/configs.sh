#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

[ -d ~/.vim ] || mkdir -v ~/.vim
[ -d ~/.config ] || mkdir -v ~/.config

dir=dotfiles
ln -sv ~/$dir/vim/plugin/ ~/.vim/plugin
ln -sv ~/$dir/vim/ftplugin/ ~/.vim/ftplugin
ln -sv ~/$dir/vim/after/ ~/.vim/after

# list of files/folders to symlink in homedir
files=(".gitconfig" ".gitignore_global" ".tmux.conf" ".vimrc" ".zshrc")
for file in ${files[@]}; do
    ln -svf ~/$dir/$file ~/$file
done

configDirs=`ls ~/$dir/.config`
for configDir in $configDirs; do
    [ -d ~/.config/$configDir ] && rm -rfv ~/.config/$configDir
    ln -svf ~/$dir/.config/$configDir ~/.config/$configDir
done
