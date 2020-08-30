#!/usr/bin/env sh

TERM="${TERM:-xterm-256color}"

if [ "$TERM" = "st-256color" ]; then
    TERM="xterm-256color"
fi

if [ "$TERM" = "tmux-256color" ]; then
    TERM="xterm-256color"
fi

export TERM
