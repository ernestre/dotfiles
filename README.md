# dotfiles

# Requirements
* Ag - [ag]
* `instant-markdown-d` : (`npm install -g instant-markdown-d`)

# tl:dr

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

# FZF
### Fuzzy finder [FZF] :
* Install fzf:
```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

# Vim
### Plugin manager [Plug] :
* Install Plug:
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
* Install plugins:
```sh
$ vim +PlugInstall +qall
```

[TPM]:https://github.com/tmux-plugins/tpm
[Plug]:https://github.com/junegunn/vim-plug
[FZF]:https://github.com/junegunn/fzf
[ag]:https://github.com/ggreer/the_silver_searcher#installing
