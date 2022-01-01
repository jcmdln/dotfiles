#!/usr/bin/env sh
#
# Copyright (c) 2022 Johnathan C Maudlin <jcmdln@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Pretend we're using Gnome for theme support
export DESKTOP_SESSION="gnome"

# Declare our Xterm configuration file
export XENVIRONMENT="$HOME/.Xresources"

# Load proper environment for the user's detected shell
user_shell="$(grep $USER /etc/passwd | grep -o '[^\/]*$')"
if [ "$user_shell" = "ksh" ]; then
    export ENV="$HOME/.kshrc"
elif [ "$user_shell" = "zsh" ]; then
    export ENV="$HOME/.zshrc"
elif [ "$user_shell" = "bash" ]; then
    export ENV="$HOME/.bashrc"
fi

# Set input/output volume to 0%
if [ -x "$(command -v sndioctl)" ]; then
    sndioctl input.level=0
    sndioctl output.level=0
fi

# Hide mouse cursor when inactive for 3 seconds
[ -n "$(command -v unclutter)" ] && unclutter -idle 3 -noevents -root &

# Set screen brightness to 15%
[ -n "$(command -v xbacklight)" ] && xbacklight -set 15%

# Start dbus
if [ -n /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
    eval `dbus-launch --sh-syntax --exit-with-x11`
fi

# Start i3
[ -n "$(command -v i3)" ] && i3
