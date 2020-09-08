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

if [ -x "$(command -v doas)" ]; then
    set -A complete_doas -- \
        $(\ls {,/usr{,/local}}/sbin | sed 's/^\/.*$//g' | sort | uniq)
fi

if [ -x "$(command -v ifconfig)" ]; then
    set -A complete_ifconfig -- $(ifconfig | grep "^[a-z]" | cut -d ":" -f1)
fi

if [ -x "$(command -v man)" ]; then
    set -A complete_man -- \
        $(man -k Nm~. | cut -d "(" -f1 | tr -d , | sort | uniq)
fi

if [ -x "$(command -v mosh)" ]; then
    set -A complete_mosh -- \
        $(cat $HOME/.ssh/known_hosts | awk -F'[, ]' '{print $1}' |
              sed 's/^\[//g; s/\]//g')
fi

if [ -x "$(command -v rcctl)" ]; then
    set -A complete_rcctl_1 -- \
        disable enable get ls order set restart start stop
    set -A complete_rcctl_2 -- $(rcctl ls all)
fi

if [ -x "$(command -v sndioctl)" ]; then
    set -A complete_sndioctl -- $(sndioctl | sed 's/\=.*$//g')
fi

if [ -x "$(command -v ssh)" ]; then
    set -A complete_ssh -- \
        $(cat $HOME/.ssh/known_hosts | awk -F'[, ]' '{print $1}' |
              sed 's/^\[//g; s/\]//g')
fi

if [ -x "$(command -v sysctl)" ]; then
    set -A complete_sysctl -- \
        $(sysctl | sed 's/\=.*$//g; s/ .*$//g' | sort | uniq)
fi

if [ -x "$(command -v vmctl)" ]; then
    set -A complete_vmctl_1 -- \
        console load reload start stop reset status send receive
fi
