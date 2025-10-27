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
alias so='source ~/.bashrc'
alias test='test2'

alias kc='kubectl'

# Kubectl Auto Complete - This is required if using the alias for kubectl
# complete -o default -F __start_kubectl kc

# Bash config
alias editsh='vim ~/.bashrc'
alias editzsh='vim ~/.zshrc'

# Alias
alias aliases='(cat ~/.bash_aliases && echo && cat ~/.bash_device) | less'
alias editaliases='vim ~/.bash_aliases'
alias editdevice='vim ~/.bash_device'
