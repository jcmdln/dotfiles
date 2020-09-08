#!/usr/bin/env sh

# Pretend we're using Gnome for theme support
export DESKTOP_SESSION=gnome

# Load proper environment for the user's detected shell
if [ "$(echo $0 | tr -d '^-')" = "ksh" ]; then
    export ENV="$HOME/.kshrc"
elif [ "$(echo $0 | tr -d '^-')" = "zsh" ]; then
    export ENV="$HOME/.zshrc"
elif [ "$(echo $0 | tr -d '^-')" = "bash" ]; then
    export ENV="$HOME/.bashrc"
fi

# Declare our Xterm configuration file
export XENVIRONMENT="$HOME/.Xresources"

# Start dbus
if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
    eval `dbus-launch --sh-syntax --exit-with-x11`
fi

# Start i3
if [ -x "$(command -v i3)" ]; then
    i3
fi
