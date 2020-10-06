#!/usr/bin/env sh

if [ "$OS_KERNEL" = "OpenBSD" ]; then
    [ -d "/usr/X11R6/man" ] && export MANPATH="$MANPATH:/usr/X11R6/man"

    # If present, add Xenocera to PATH
    [ -d "/usr/X11R6" ] && PATH="$PATH:/usr/X11R6/bin"

    # If present, add games to path
    [ -d "/usr/games" ] && PATH="$PATH:/usr/games"

    export PATH
fi
