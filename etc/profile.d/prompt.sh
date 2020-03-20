#!/usr/bin/env sh

PROMPT_COMMAND="history -a"

if [ -e "$ZSH_VERSION" ]; then
    PS1="[%n@%M %d]$ "
else
    # Set prompt
    PS1="[\u@\h \W]\$ "

    # Set terminal title
    PS1="\[\e];\u@\h: \w\a\]$PS1"
fi

export PROMPT_COMMAND PS1
