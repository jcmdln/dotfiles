#!/usr/bin/env sh

if [ -f "$HOME/.cargo/env" ]; then
    . ~/.cargo/env
elif [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi
