#!/usr/bin/env bash

# Load global bashrc
. /etc/bash.bashrc

# Load local bashrc
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
