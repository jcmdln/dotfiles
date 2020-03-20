#!/usr/bin/env sh

MANPATH="/usr/man:/usr/share/man:/usr/local/man:/usr/local/share/man"
MANPATH="$MANPATH:$HOME/man:$HOME/.local/man:$HOME/.local/share/man"

if [ -d "/usr/X11R6/man" ]; then
    MANPATH="$MANPATH:/usr/X11R6/man"
fi

export MANPATH
