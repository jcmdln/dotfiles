#!/usr/bin/env bash

# Load global bashrc
[ -f /etc/bashrc ] && source /etc/bashrc
[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc

# Load local bashrc
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
