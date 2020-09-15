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
