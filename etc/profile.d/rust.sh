#!/usr/bin/env sh

if [ -x "$(command -v cargo)" ]; then
    PATH="$PATH:$HOME/.cargo/bin"
fi

export PATH
