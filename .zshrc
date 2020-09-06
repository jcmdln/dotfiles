#!/usr/bin/env zsh

export ZSH="$HOME/.config/ohmyzsh"
export ZSH_THEME="risto"
export plugins=(cargo emacs git man mosh python rust tmux)
[ ! -d "$ZSH" ] && git clone https://github.com/ohmyzsh/ohmyzsh "$ZSH"
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
