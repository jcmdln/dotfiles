#!/usr/bin/env sh

if [ -x "$(command -v go)" ]; then
    GOPATH="$HOME/.local/go"
    GOBIN="$GOPATH/bin"
    GODOC="$GOPATH/doc"
    PATH="$PATH:$GOBIN"
    export GOPATH GOBIN GODOC PATH
fi
