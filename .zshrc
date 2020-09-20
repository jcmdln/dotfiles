#!/usr/bin/env zsh

export ZSH="$HOME/.config/ohmyzsh"
export ZSH_THEME="risto"
export plugins=(cargo git man mosh python rust tmux)

# Allow skipping ohmyzsh requirements if not installed and git not present
if [ ! -d "$ZSH" ]; then
    if [ -x "$( command -v git)" ]; then
        git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh "$ZSH"
        source "$ZSH/oh-my-zsh.sh"
    fi
else
    source "$ZSH/oh-my-zsh.sh"
fi

# If we're in tmux, don't use bracketed paste
if [ -n "$TMUX" ]; then
    unset zle_bracketed_paste
else
    autoload -Uz bracketed-paste-magic
    zle -N bracketed-paste bracketed-paste-magic
fi

# Load global profile
[ -f /etc/profile ] && source /etc/profile

# Load local profile
[ -f "$HOME/.profile" ] && source "$HOME/.profile"
