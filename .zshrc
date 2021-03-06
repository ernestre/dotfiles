# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.composer/vendor/bin:/usr/local/go/bin:$HOME/.yarn/bin

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export EDITOR=nvim

ZSH_THEME="cloud"

plugins=(git docker docker-compose web-search colorize redis-cli wd tmuxinator pass bgnotify)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

# Linux alternative for OSX pbcopy
if ! [ -x "$(command -v pbpaste)" ]; then
    alias pbpaste='xclip -selection clipboard -o'
fi

if ! [ -x "$(command -v pbcopy)" ]; then
    alias pbcopy='xclip -selection clipboard'
fi

if [ -x "$(command -v fdfind)" ]; then
    alias fd='fdfind'
fi

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
alias gcb='git checkout $(git branch --sort=-committerdate --no-merged | fzf)'
alias gct='git checkout $(git tag | fzf)'
alias p="fzf --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
alias fs="ssh \$(cat ~/.ssh/config | grep 'Host ' | awk '{print \$2}' | fzf)"
alias dsh="docker exec -it \$(docker ps --format '{{.Names}}' | fzf) bash"
alias dstop="docker stop \$(docker ps --format '{{.Names}}' | fzf)"
alias dstart="docker start \$(docker ps -a --format '{{.Names}}' | fzf)"
alias ppjson="pbpaste | python3 -m json.tool | bat -l json"

# Repeat the command
r () {
    while true; do $@; done
}

# Start vim session if session file exists
alias vims='[[ -f Session.vim ]] && vim -S || vim'

DEFAULT_USER="$USER"


[[ ! -f ~/.aliases ]] || source ~/.aliases
[[ ! -f ~/.ssh-aliases ]] || source ~/.ssh-aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# use RG for fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

export LESS="-XRFS" # dont wrap long lines in less;

if [ -x "$(command -v xset)" ]; then
    xset r rate 200 85
fi
