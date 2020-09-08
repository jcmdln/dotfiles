# ~/.kshrc

# Load global kshrc
# . /etc/ksh.kshrc

# Load global profile
if [ -f /etc/profile ]; then
    . /etc/profile
fi

# Load local profile
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

#
# Completions
#

_ssh_hosts() {
    if [ -f "$HOME/.ssh/config" ]; then
        cat "$HOME/.ssh/config" | grep "Host \S*" | grep -v "*" |
            sed "s/Host //g" | tr ' ' '\n' | sort | uniq
    elif [ -f "$HOME/.ssh/known_hosts" ]; then
        cat "$HOME/.ssh/known_hosts" | awk -F'[, ]' '{print $1}' |
            sed 's/^\[//g; s/\]//g' | sort | uniq
    fi
}

set -A complete_doas -- \
    $(\ls {,/usr{,/local}}/sbin | sed 's/^\/.*$//g' | sort | uniq)

set -A complete_ifconfig -- $(ifconfig | grep "^[a-z]" | cut -d ":" -f1)

if [ -x "$(command -v git)" ]; then
    set -A complete_git_1 -- \
        checkout cherry-pick clean clone commit config mpull mpush pull push \
        status
fi

if [ -x "$(command -v got)" ]; then
    set -A complete_got_1 -- \
        blame backout branch commit checkout cherrypick diff histedit import \
        init log rebase ref remove revert stage status tree unstage update
fi

# set -A complete_man -- \
#     $(man -k Nm~. | cut -d "(" -f1 | tr -d , | sort | uniq)

if [ -x "$(command -v mosh)" ]; then
    set -A complete_mosh -- $(_ssh_hosts)
fi

set -A complete_openrsync -- \
    -a --address -D --del --delete --devices -e --rsh -g --group -l \
    --links -n --dry-run --numeric-ids -o --owner -p --perms --port -r \
    --recursive --rsync-path --specials -t --times -v --verbose -x \
    --version

set -A complete_rcctl_1 -- \
    disable enable get ls order set restart start stop
set -A complete_rcctl_2 -- $(rcctl ls all)

set -A complete_signify_1 -- -C -G -S -V
set -A complete_signify_2 -- -q -p -x -c -m -t -z
set -A complete_signify_3 -- -p -x -c -m -t -z

set -A complete_sndioctl -- $(sndioctl | sed 's/\=.*$//g')

set -A complete_ssh -- $(_ssh_hosts)

set -A complete_sysctl -- \
    $(sysctl | sed 's/\=.*$//g; s/ .*$//g' | sort | uniq)

set -A complete_vmctl_1 -- \
    console load reload start stop reset status send receive
