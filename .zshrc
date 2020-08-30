#!/usr/bin/env zsh

# ZSH-specific configuration
ZSH="/home/$(whoami)/.oh-my-zsh"
if [ ! -d "$ZSH" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

plugins=(git man tmux)
ZSH_THEME="risto"
COMPLETION_WAITING_DOTS="true"
source "$ZSH"/oh-my-zsh.sh

# Load global config
if [ -e /etc/profile ]; then
    source /etc/profile
fi

# Load local config
if [ -e "$HOME"/.profile ]; then
    source "$HOME"/.profile
fi

# If we're in tmux, don't use bracketed paste
if [ -n "$TMUX" ]; then
    unset zle_bracketed_paste
fi
