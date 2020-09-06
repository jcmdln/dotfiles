#!/usr/bin/env zsh

# ohmyzsh settings
export ZSH="$HOME/.config/oh-my-zsh"
export CHSH="no"
export RUNZSH="no"
export KEEP_ZSHRC="yes"

# Install ohmyzsh if missing
if [ ! -d "$ZSH" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Load oh-my-zsh
export ZSH_THEME="risto"
export plugins=(cargo emacs git man mosh python rust tmux)
source "$ZSH/oh-my-zsh.sh"

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
