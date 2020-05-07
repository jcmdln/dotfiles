#!/usr/bin/env sh

# Load global profile
if [ -f /etc/profile ]; then
    . /etc/profile
fi

MANPATH="/usr/man:/usr/share/man:/usr/local/man:/usr/local/share/man"
MANPATH="$MANPATH:$HOME/man:$HOME/.local/man:$HOME/.local/share/man"

if [ -d "/usr/X11R6/man" ]; then
    MANPATH="$MANPATH:/usr/X11R6/man"
fi

export MANPATH

PATH="/sbin:/usr/sbin:/opt/sbin:/usr/local/sbin/"
PATH="$PATH:/bin:/usr/bin:/opt/bin:/usr/local/bin"
PATH="$PATH:$HOME/bin:$HOME/.local/bin"

# If present, add Xenocera to PATH
if [ -d "/usr/X11R6" ]; then
    PATH="$PATH:/usr/X11R6/bin"
fi

# If present, add games to path
if [ -d "/usr/games" ]; then
    PATH="$PATH:/usr/games"
fi

export PATH

# Load local profile.d scripts
if [ -d "$HOME"/.profile.d ]; then
    for script in "$HOME"/.profile.d/*.sh; do
        if [ -r "$script" ]; then
            . "$script"
        fi
    done

    unset script
fi
