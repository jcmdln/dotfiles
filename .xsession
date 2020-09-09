#!/usr/bin/env sh

# Pretend we're using Gnome for theme support
export DESKTOP_SESSION=gnome

# Load proper environment for the user's detected shell
if [ "$(grep $USER /etc/passwd | grep -o '[^\/]*$')" = "ksh" ]; then
    export ENV="$HOME/.kshrc"
elif [ "$(grep $USER /etc/passwd | grep -o '[^\/]*$')" = "zsh" ]; then
    export ENV="$HOME/.zshrc"
elif [ "$(grep $USER /etc/passwd | grep -o '[^\/]*$')" = "bash" ]; then
    export ENV="$HOME/.bashrc"
fi

# Declare our Xterm configuration file
export XENVIRONMENT="$HOME/.Xresources"

# Set input/output volume to 0%
if [ -x "$(command -v sndioctl)" ]; then
    sndioctl input.level=0
    sndioctl output.level=0
fi

# Hide mouse cursor when inactive for 3 seconds
if [ -n "$(command -v unclutter)" ]; then
    unclutter -idle 3 -noevents -root &
fi

# Set screen brightness to 15%
if [ -n "$(command -v xbacklight)" ]; then
   xbacklight -set 15%
fi

# Start dbus
if [ -n /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
    eval `dbus-launch --sh-syntax --exit-with-x11`
fi

# Start i3
if [ -n "$(command -v i3)" ]; then
    i3
fi
