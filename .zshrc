# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.composer/vendor/bin:/usr/local/go/bin:$HOME/.yarn/bin

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export TERM="xterm-256color"

export EDITOR=/usr/local/bin/nvim

ZSH_THEME="cloud"

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

# Linux alternative for OSX pbcopy
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# Start vim session if session file exists
alias vims='[[ -f Session.vim ]] && vim -S || vim'

DEFAULT_USER="$USER"

source ~/.aliases
source ~/.ssh-aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# use RG for fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

export LESS="-XRFS" # dont wrap long lines in less;
