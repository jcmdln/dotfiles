# /etc/profile.d/alias.sh

alias dd="dd status=progress"
alias df="df -h"
if [ "$(uname -s)" = "OpenBSD" ]; then
    alias ls="ls -hF"
else
    alias ls="ls -hF --group-directories-first"
fi
alias mkdir="mkdir -p"
alias mv="mv -i"
alias rm="rm -i"
alias rsync="rsync -haczP --ignore-existing"
