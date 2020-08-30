#!/usr/bin/env sh

if [ -x "$(command -v emacsclient)" ]; then
    export EDITOR="emacsclient"
elif [ -x "$(command -v vim)" ]; then
    export EDITOR="vim"
fi
