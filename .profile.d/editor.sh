#!/usr/bin/env sh

if [ -n "$(command -v emacsclient)" ]; then
    export EDITOR="emacsclient -tca ''"
elif [ -n "$(command -v vim)" ]; then
    export EDITOR="vim"
fi
