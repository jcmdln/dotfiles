#!/usr/bin/env sh

if [ -x "$(command -v go)" ]; then
    export GOPATH="$HOME/.local/go"
    export GOBIN="$GOPATH/bin"
    export GODOC="$GOPATH/doc"
    export PATH="$PATH:$GOBIN"
fi
