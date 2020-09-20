#!/usr/bin/env sh

export PIP_DISABLE_PIP_VERSION_CHECK=1

# Poetry
[ -e "$HOME/.poetry/bin" ] && export PATH="$HOME/.poetry/bin:$PATH"
