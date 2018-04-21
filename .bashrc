source /usr/share/defaults/etc/profile

export PS1='\[\033[;0;035m\][\w] \[\e[0m\]'

if [ -f ~/.bash_aliases ];then
    . ~/.bash_aliases
fi

xset s off
xset -dpms
