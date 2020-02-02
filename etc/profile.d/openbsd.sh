#!/usr/bin/env sh

if [ "$(uname -s)" = "OpenBSD" ]; then
    alias df="df -h"
    alias mkdir="mkdir -p"
    alias ls="ls -hCF"
    alias openrsync="openrsync --rsync-path=openrsync -lrt"

    if [ -n "$(command -v tree)" ]; then
        alias tree="tree -F"
    fi

    if [ -x "$(command -v rsync)" ]; then
        alias rsync="rsync -achzP"
    fi

    # If present, add Xenocera to PATH and MANPATH
    if [ -d "/usr/X11R6" ]; then
        PATH="$PATH:/usr/X11R6/bin"
        MANPATH="$MANPATH:/usr/X11R6/man"
        export PATH MANPATH
    fi

    # If present, add games to path
    if [ -d "/usr/games" ]; then
        PATH="$PATH:/usr/games"
        export PATH
    fi
fi
