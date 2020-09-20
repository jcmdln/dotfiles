#!/usr/bin/env ksh

# Load global profile
[ -f /etc/profile ] && . /etc/profile

# Load local profile
[ -f "$HOME/.profile" ] && . "$HOME/.profile"

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
