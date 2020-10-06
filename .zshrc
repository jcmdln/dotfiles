#!/usr/bin/env zsh

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
