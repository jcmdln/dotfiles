# /etc/profile.d/defaults.sh
#
# Define various exports that don't need a separate section or file.

export LANG="en_US.UTF-8"
export PAGER="less"
export PROMPT_COMMAND="history -a"

if [ "$TERM" = "tmux-256color" ] && [ -z "$TMUX" ]; then
    export TERM="xterm-256color"
fi
