#!/usr/bin/env sh

export PROMPT_COMMAND="history -a"

if [ -n "$ZSH_VERSION" ]; then
    PS1="[%n@%M %1~]$ "
else
    PS1="[\u@\h \W]\$ "

    if [ -n "$DISPLAY" ] || [ -n "$SSH_TTY" ]; then
        PS1="\[\e];\u@\h: \w\a\]$PS1"
    fi
fi

export PS1
