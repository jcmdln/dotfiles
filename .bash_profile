#!/usr/bin/env bash

# Load global bashrc
. /etc/bash.bashrc

# Load local bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
