#!/usr/bin/env sh

if [ -e "$HOME/.deno" ]; then
    export DENO_INSTALL="$HOME/.deno"
    export PATH="$DENO_INSTALL/bin:$PATH"
fi
