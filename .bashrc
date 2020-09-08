#!/usr/bin/env bash

shopt -s checkwinsize
shopt -s histappend
shopt -s no_empty_cmd_completion

# Load global profile
if [ -f /etc/profile ]; then
    . /etc/profile
fi

# Load local profile
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi
