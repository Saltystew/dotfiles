# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cls='clear'
alias vi='vim'
alias ls='ls -h --color=always'
alias ll='ls -hl --color=always'
alias lsa='ls -hla --color=always'
alias duh1='du -h --max-depth=1'
alias sudo='sudo '
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
alias dcrun='docker-compose -f /docker/compose/docker-compose.yml'
alias dcedit='vi /docker/compose/docker-compose.yml'
alias dclogs='docker-compose -f /docker/compose/docker-compose.yml logs -tf --tail="50"'
alias dlogs='docker logs -tf --tail="50"'
alias doc='docker'
