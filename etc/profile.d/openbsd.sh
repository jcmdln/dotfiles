# ~/.profile.d/openbsd.sh

if [ "$(uname -s)" == "OpenBSD" ]; then
    alias df="df -h"
    alias mkdir="mkdir -p"
    alias ls="ls -hCF"
    alias openrsync="openrsync --rsync-path=openrsync -lrt"

    if [ -x "$(command -v rsync)" ]; then
        alias rsync="rsync -achzP"
    fi

    # If present, add Xenocera to PATH and MANPATH
    if [ -d "/usr/X11R6" ]; then
        export PATH="$PATH:/usr/X11R6/bin"
        export MANPATH="$MANPATH:/usr/X11R6/man"
    fi

    # If present, add games to path
    if [ -d "/usr/games" ]; then
        export PATH="$PATH:/usr/games"
    fi
fi
