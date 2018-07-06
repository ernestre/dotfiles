# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.composer/vendor/bin

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export EDITOR=/usr/local/bin/vim

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs docker_machine time)
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S \uf073 %d.%m.%y}"
POWERLEVEL9K_VCS_TAG_ICON='\uf9f8'

plugins=(git docker docker-compose web-search tmux colorize redis-cli)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

alias gs='git status'
alias gac='git add . && git commit -v'
alias guc='git add -u && git commit -v'
alias gaca='git add . && git commit -v --amend'
alias gacan='gaca --no-edit'
alias gfu='git fetch upstream'
alias cp='cp -v'
alias rm='rm -v'
alias cat='ccat'
DEFAULT_USER="$USER"

source ~/.aliases
