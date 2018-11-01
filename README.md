# dotfiles

# Requirements
* [ag](https://github.com/ggreer/the_silver_searcher#installing)
* [vim-instant-markdown](https://github.com/suan/vim-instant-markdown) (`npm install -g instant-markdown-d`)
* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) : (`npm install -g diff-so-fancy`)
* [alacritty](https://github.com/jwilm/alacritty): A cross-platform, GPU-accelerated terminal emulator
    * [cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html)
* [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts): MesloLGS Nerd Font:12

# tl:dr

```sh
$ git clone https://github.com/ernestre/dotfiles.git && cd dotfiles && sh install.sh
```

---

# Tmux
### [TPM](https://github.com/tmux-plugins/tpm) :
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
### Fuzzy finder [FZF](https://github.com/junegunn/fzf) :
* Install fzf:
```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

# Vim
### Plugin manager [Plug](https://github.com/junegunn/vim-plug) :
* Install Plug:
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
* Install plugins:
```sh
$ vim +PlugInstall +qall
