# ~/.profile.d/linux.sh

if [ "$(uname -s)" = "Linux" ]; then
    alias dd="dd status=progress"
    alias grep="grep"
    alias ls="ls -F"
    alias mkdir="mkdir -p"
    alias rsync="rsync -haczP --ignore-existing"

    if [ "$SHELL" != "/bin/ash" ]; then
        alias df="df -h"
        alias free="free -h"
        alias grep="grep --color=auto"
        alias ln="ln -i"
        alias ls="ls -h --color=auto --group-directories-first"
        alias mv="mv -i"
        alias rm="rm -i"
        alias tree="tree -C --dirsfirst"
    fi
fi
