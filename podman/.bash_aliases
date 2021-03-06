alias cls='clear'
alias podlogs='podman logs -tf --tail="50"'
alias pod='podman'
alias podps='podman ps --format "table {{.Names}}\t{{.Status}}"'
alias podpsa='podman ps -a --format "table {{.Names}}\t{{.Status}}"'
alias duh1='du -h --max-depth=1'
alias gc='git commit'
alias gcam='git commit -am'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gp='git pull --rebase'
alias gs='git status'
alias ll='ls -hl --color=auto'
alias ls='ls -h --color=auto'
alias lsa='ls -lha --color=auto'
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
alias sudo='sudo '
alias vi='vim'
