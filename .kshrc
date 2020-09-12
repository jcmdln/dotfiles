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
        $@ && sleep 5 || return
    done
}

#
# Completions
#

_doas() {
    local FILE="/tmp/_complete_doas"
    if [ ! -f $FILE ]; then
        \ls {,/usr{,/local}}/sbin | sed 's/^\/.*$//g' | sort |
            uniq > $FILE
    fi
    cat $FILE
}

[ -n "$(command -v doas)" ] &&
    set -A complete_doas -- $(_doas)

[ -n "$(command -v ifconfig)" ] &&
    set -A complete_ifconfig -- $(ifconfig | grep "^[a-z]" | cut -d ":" -f1)

[ -n "$(command -v git)" ] &&
    set -A complete_git_1 -- \
        checkout cherry-pick clean clone commit config mpull mpush pull push \
        status

[ -n "$(command -v got)" ] &&
    set -A complete_got_1 -- \
        blame backout branch commit checkout cherrypick diff histedit import \
        init log rebase ref remove revert stage status tree unstage update

_man() {
    local FILE="/tmp/_complete_man"
    if [ ! -f $FILE ]; then
        man -k Nm~. | cut -d "(" -f1 | tr -d , | sort | uniq > $FILE
    fi
    cat $FILE
}

[ -n "$(command -v man)" ] &&
    set -A complete_man -- $(_man)

[ -n "$(command -v rcctl)" ] &&
    set -A complete_rcctl_1 -- \
        disable enable get ls order set restart start stop &&
    set -A complete_rcctl_2 -- $(rcctl ls all)

[ -n "$(command -v signify)" ] &&
    set -A complete_signify_1 -- -C -G -S -V &&
    set -A complete_signify_2 -- -q -p -x -c -m -t -z &&
    set -A complete_signify_3 -- -p -x -c -m -t -z

[ -n "$(command -v sndioctl)" ] &&
    set -A complete_sndioctl -- $(sndioctl | sed 's/\=.*$//g')

_ssh() {
    if [ -f "$HOME/.ssh/config" ]; then
        cat "$HOME/.ssh/config" | grep "Host \S*" | grep -v "*" |
            sed "s/Host //g" | tr ' ' '\n' | sort | uniq
    elif [ -f "$HOME/.ssh/known_hosts" ]; then
        cat "$HOME/.ssh/known_hosts" | awk -F'[, ]' '{print $1}' |
            sed 's/^\[//g; s/\]//g' | sort | uniq
    fi
}

[ -n "$(command -v mosh)" ] &&
    set -A complete_mosh -- $(_ssh)

[ -n "$(command -v openrsync)" ] &&
    set -A complete_openrsync -- $(ls $PWD) $(_ssh)

[ -n "$(command -v rsync)" ] &&
    set -A complete_rsync -- $(ls $PWD) $(_ssh)

[ -n "$(command -v sftp)" ] &&
    set -A complete_sftp -- $(_ssh)

[ -n "$(command -v ssh)" ] &&
    set -A complete_ssh -- $(_ssh)

_sysctl() {
    local FILE="/tmp/_complete_sysctl"
    if [ ! -f $FILE ]; then
        sysctl | sed 's/\=.*$//g; s/ .*$//g' | sort |
            uniq > $FILE
    fi
    cat $FILE
}

[ -n "$(command -v sysctl)" ] &&
    set -A complete_sysctl -- $(_sysctl)

[ -n "$(command -v vmctl)" ] &&
    set -A complete_vmctl_1 -- \
        console load reload start stop reset status send receive
