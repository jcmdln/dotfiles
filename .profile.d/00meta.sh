#!/usr/bin/env sh
#
# Copyright (c) 2020 Johnathan C Maudlin <jcmdln@gmail.com>
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

export OS_KERNEL="$(uname -s)"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

if [ "$OS_KERNEL" = "Linux" ]; then
    export OS_ID=$(awk -F\= '/^ID/ {print $2}' /etc/os-release)
    export OS_NAME=$(awk -F\= '/^NAME/ {print $2}' /etc/os-release)
    export OS_VERSION=$(awk -F\" '/^VERSION=/ {print $2}' /etc/os-release)
    export OS_VERSION_CODENAME=$(awk -F\" '/^VERSION_CODENAME/ {print $2}' /etc/os-release)
    export OS_VERSION_ID=$(awk -F\= '/^VERSION_ID/ {print $2}' /etc/os-release)
elif [ "$OS_KERNEL" = "OpenBSD" ]; then
    export OS_ID=$(sysctl -n kern.ostype | awk '{print tolower($0)}')
    export OS_NAME=$(sysctl -n kern.ostype)
    export OS_VERSION=$(sysctl -n kern.osrelease)
    export OS_VERSION_CODENAME=$(sysctl -n kern.osrelease)
    export OS_VERSION_ID=$(sysctl -n kern.osrelease)
fi
