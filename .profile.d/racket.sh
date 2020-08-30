#!/usr/bin/env sh

if [ -x "$HOME/.local/racket" ]; then
    export MANPATH="$MANPATH:$HOME/.local/racket/man"
    export PATH="$PATH:$HOME/.local/racket/bin"
fi
