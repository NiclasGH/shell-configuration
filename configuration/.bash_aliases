# Managed by script. 
# Please keep this in sync using pull.sh before and push after making changes
# Core
alias ll='ls -alF'
alias gitm='git commit -m'
alias gitam='git commit --amend'
alias gita='git add .'
alias gitpullf='git reset --hard && git fetch && git pull'
alias gitpull='git stash && git fetch && git pull && git stash pop'
alias code='codium'
alias vim='nvim'
alias query='ls | grep'
alias editvim='vim ~/.config/nvim'
alias tovim='cd ~/.config/nvim'
alias m='make'

alias kc='kubectl'

# Bash config
alias editsh='vim ~/.bashrc'
alias editzsh='vim ~/.zshrc'

# Alias
alias aliases='(cat ~/.bash_aliases && echo && cat ~/.bash_device) | less'
alias editaliases='vim ~/.bash_aliases'
alias editfunctions='vim ~/.bash_functions'
alias editdevice='vim ~/.bash_device'
