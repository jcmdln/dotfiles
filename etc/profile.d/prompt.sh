#!/usr/bin/env sh

export PROMPT_COMMAND="history -a"

if [ -e "$ZSH_VERSION" ]; then
    PS1="[%n@%M %d]$ "
else
    PS1="[\u@\h \W]\$ "

    if [ -n "$DISPLAY" ] || [ -n "$SSH_TTY" ]; then
        PS1="\[\e];\u@\h: \w\a\]$PS1"
    fi
fi

export PS1
