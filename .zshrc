# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.composer/vendor/bin:/usr/local/go/bin

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export TERM="xterm-256color"

export EDITOR=/usr/local/bin/nvim

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

plugins=(git docker docker-compose web-search colorize redis-cli wd)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

alias gs='git status'
alias gac='git add . && git commit -v'
alias guc='git add -u && git commit -v'
alias gaca='git add . && git commit -v --amend'
alias gacan='gaca --no-edit'
alias gfu='git fetch upstream'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias todayTodo="vim +VimwikiMakeDiaryNote"
alias tomorrowTodo="vim +VimwikiMakeTomorrowDiaryNote"
alias yesterdayTodo="vim +VimwikiMakeYesterdayDiaryNote"
alias vim=nvim
alias gcb='git checkout $(git branch | fzf)'
alias gct='git checkout $(git tag | fzf)'
alias p='fzf --preview="head -$LINES {}"'
alias fs="ssh \$(cat ~/.ssh/config | grep 'Host ' | awk '{print \$2}' | fzf)"

DEFAULT_USER="$USER"

source ~/.aliases
source ~/.ssh-aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# use RG for fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

export LESS="-XRFS" # dont wrap long lines in less
