#!/usr/bin/env sh

[ -n "$(command -v rsync)" ] && alias rsync="\rsync -achzP"
[ -n "$(command -v unzip)" ] && alias unzip="\unzip -q"

if [ "$OS_RELEASE_KERNEL" = "Linux" ]; then
    alias dd="\dd status=progress"
    alias ls="\ls -F"
    alias mkdir="\mkdir -p"

    if [ "$SHELL" != "/bin/ash" ]; then
        alias df="\df -h"
        alias free="\free -h"
        alias grep="\grep --color=auto"
        alias ln="\ln -i"
        alias ls="\ls -hv --color=auto --group-directories-first"
        alias mv="\mv -i"
        alias rm="\rm -i"
        alias tree="\tree -C --dirsfirst"
    fi
elif [ "$OS_RELEASE_KERNEL" = "OpenBSD" ]; then
    alias df="\df -h"
    alias du="\du -h"
    alias ls="\ls -hCF"
    alias mkdir="\mkdir -p"
    alias mv="\mv -i"
    alias openrsync="\openrsync --rsync-path=openrsync -lrtv"

    [ -n "$(command -v tree)" ] && alias tree="\tree -F"
fi
