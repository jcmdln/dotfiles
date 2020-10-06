#!/usr/bin/env sh

if [ -n "$DISPLAY" ] && [ "$(tty | grep -c 'p')" -gt 0 ]; then
    TERM="xterm-256color"
else
    TERM="vt220"
fi

export TERM
