#!/usr/bin/env sh

if [ -x "$(command -v rsync)" ]; then
    alias rsync="rsync -achzP"
fi

if [ "$(uname -s)" = "Linux" ]; then
    alias dd="dd status=progress"
    alias ls="ls -F"
    alias mkdir="mkdir -p"
    alias rsync="rsync -achzP"

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

if [ "$(uname -s)" = "OpenBSD" ]; then
    alias df="df -h"
    alias mkdir="mkdir -p"
    alias ls="ls -hCF"
    alias openrsync="openrsync --rsync-path=openrsync -lrt"

    if [ -n "$(command -v tree)" ]; then
        alias tree="tree -F"
    fi
fi
