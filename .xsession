#!/usr/bin/env sh

# Pretend we're using Gnome for theme support
export DESKTOP_SESSION=gnome

# Ensure Environment is loaded
export ENV="$HOME/.profile"
export XENVIRONMENT="$HOME/.Xdefaults"

# Set screen brightness to 20%
xbacklight -set 20%

# Hide mouse cursor when inactive for 3 seconds
if [ -x "$(command -v unclutter)" ]; then
    unclutter -idle 3 -noevents -root &
fi

# Start dbus
if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
    eval `dbus-launch --sh-syntax --exit-with-x11`
fi

# Start i3
if [ -x "$(command -v i3)" ]; then
    i3
fi
