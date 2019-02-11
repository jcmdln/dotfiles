# /etc/profile.d/alias.sh

alias dd="dd status=progress"
alias df="df -h"

if [ "$(uname -s)" = "OpenBSD" ]; then
    alias ls="ls -hF"
else
    alias grep="grep --color=auto"
    alias ls="ls -hF --color=auto --group-directories-first"
fi

alias mkdir="mkdir -p"
alias mv="mv -i"
alias rm="rm -i"
alias rsync="rsync -haczP --ignore-existing"
