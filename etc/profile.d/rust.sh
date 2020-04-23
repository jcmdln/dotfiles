#!/usr/bin/env sh

if [ -x "$(command -v cargo)" ]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi
