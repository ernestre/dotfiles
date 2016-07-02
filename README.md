# dotfiles

#tl:dr

```sh
$ git clone https://github.com/ernestre/dotfiles.git && cd dotfiles && sh install.sh
```

---

# Tmux
### [TPM] :
Requirements: tmux version 1.9 (or higher), git, bash.

* Install tmux package manager:
```sh
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
* Install tmux plugins:
```sh
$ ~/.tmux/plugins/tpm/bin/install_plugins
```

# Vim
### [Vundle] :
* Install vundle:
```sh
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
* Install plugins:
```sh
$ vim +PluginInstall +qall
```

[TPM]:https://github.com/tmux-plugins/tpm
[Vundle]:https://github.com/VundleVim/Vundle.vim
