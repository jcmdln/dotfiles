#!/usr/bin/env bash

# Ensure the global profile is loaded before proceeding
if [ -e /etc/profile ]; then
    . /etc/profile
fi

# Some bash-isms to run if shopt is available
if [ -v "$(command -v shopt)" ]; then
    shopt -s checkwinsize
    shopt -s no_empty_cmd_completion
    shopt -s histappend
fi

# load the user's local profile
if [ -f ~/.profile ]; then
    . ~/.profile
fi
