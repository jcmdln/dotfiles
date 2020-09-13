#!/usr/bin/env ksh

# Load global profile
if [ -f /etc/profile ]; then
    . /etc/profile
fi

# Load local profile
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

#
# Helpers
#

watch() {
    while :; do
        clear
        echo "watch: $@\n"
        $@ && sleep 2 || return
    done
}

#
# Completions
#

if [ -n "$(command -v doas)" ]; then
    set -A complete_doas -- \
        $(\ls {,/usr{,/local}}/sbin | sed 's/^\/.*$//g' | sort | uniq)
fi

if [ -n "$(command -v ifconfig)" ]; then
    set -A complete_ifconfig -- $(ifconfig | grep "^[a-z]" | cut -d ":" -f1)
fi

if [ -n "$(command -v git)" ]; then
    set -A complete_git_1 -- \
        checkout cherry-pick clean clone commit config mpull mpush pull push \
        status
fi

if [ -n "$(command -v got)" ]; then
    set -A complete_got_1 -- \
        blame backout branch commit checkout cherrypick diff histedit import \
        init log rebase ref remove revert stage status tree unstage update
fi

if [ -n "$(command -v man)" ]; then
    FILE="/tmp/_complete_man"
    if [ ! -e $FILE ]; then
        man -k Nm~. | cut -d "(" -f1 | tr -d , | sort | uniq > $FILE
    fi

    set -A complete_man -- $(\cat $FILE)

    unset FILE
fi

if [ -n "$(command -v rcctl)" ]; then
    set -A complete_rcctl -- $(rcctl ls all)
    set -A complete_rcctl_1 -- \
        disable enable get ls order set restart start stop
fi

if [ -n "$(command -v signify)" ]; then
    set -A complete_signify_1 -- -C -G -S -V
    set -A complete_signify_2 -- -q -p -x -c -m -t -z
    set -A complete_signify_3 -- -p -x -c -m -t -z
fi

if [ -n "$(command -v sndioctl)" ]; then
    set -A complete_sndioctl -- $(sndioctl | sed 's/\=.*$//g')
fi

_ssh() {
    if [ -f "$HOME/.ssh/config" ]; then
        cat "$HOME/.ssh/config" | grep "Host \S*" | grep -v "*" |
            sed "s/Host //g" | tr ' ' '\n' | sort | uniq
    elif [ -f "$HOME/.ssh/known_hosts" ]; then
        cat "$HOME/.ssh/known_hosts" | awk -F'[, ]' '{print $1}' |
            sed 's/^\[//g; s/\]//g' | sort | uniq
    fi
}

if [ -n "$(command -v mosh)" ]; then
    set -A complete_mosh -- $(_ssh)
fi

if [ -n "$(command -v openrsync)" ]; then
    set -A complete_openrsync -- $(ls) $(_ssh)
fi

if [ -n "$(command -v rsync)" ]; then
    set -A complete_rsync -- $(ls) $(_ssh)
fi

if [ -n "$(command -v sftp)" ]; then
    set -A complete_sftp -- $(ls) $(_ssh)
fi

if [ -n "$(command -v ssh)" ]; then
    set -A complete_ssh -- $(_ssh)
fi

if [ -n "$(command -v sysctl)" ]; then
    if [ -z "$_SYSCTL" ]; then
        _SYSCTL="$(sysctl | sed 's/\=.*$//g; s/ .*$//g' | sort | uniq)"
    fi

    set -A complete_sysctl -- $(echo $_SYSCTL)
    set -A complete_sysctl_1 -- -A -a -n -q $(echo $_SYSCTL)

    unset _SYSCTL
fi

if [ -n "$(command -v unwindctl)" ]; then
    set -A complete_unwindctl_1 -- log reload status
fi

if [ -n "$(command -v vmctl)" ]; then
    set -A complete_vmctl_1 -- \
        console load reload start stop reset status send receive
fi
