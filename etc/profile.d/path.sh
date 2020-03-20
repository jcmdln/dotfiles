#!/usr/bin/env sh

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
