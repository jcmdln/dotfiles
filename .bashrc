#!/usr/bin/env bash

shopt -s checkwinsize
shopt -s histappend
shopt -s no_empty_cmd_completion

# Load global profile
[ -f /etc/profile ] && source /etc/profile

# Load local profile
[ -f "$HOME/.profile" ] && source "$HOME/.profile"
