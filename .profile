#!/usr/bin/env sh

# Load global profile
[ -f /etc/profile ] && . /etc/profile

MANPATH="/usr/man:/usr/share/man:/usr/local/man:/usr/local/share/man"
MANPATH="$MANPATH:$HOME/man:$HOME/.local/man:$HOME/.local/share/man"

export MANPATH

PATH="/sbin:/usr/sbin:/opt/sbin:/usr/local/sbin/"
PATH="$PATH:/bin:/usr/bin:/opt/bin:/usr/local/bin"
PATH="$PATH:$HOME/bin:$HOME/.local/bin"

export PATH

# Load local profile.d scripts
if [ -d "$HOME/.profile.d" ]; then
    for script in $HOME/.profile.d/*.sh; do
        [ -r "$script" ] && . "$script"
    done; unset script
fi
