#!/usr/bin/env sh

export PIP_DISABLE_PIP_VERSION_CHECK=1

if [ -e "$HOME/.poetry/bin" ]; then
    export PATH="$HOME/.poetry/bin:$PATH"
fi
