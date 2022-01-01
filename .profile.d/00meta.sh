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

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export OS_KERNEL="$(uname -s)"
if [ "$OS_KERNEL" = "Linux" ]; then
    OS_ID=$(awk -F\= '/^ID/ {print $2}' /etc/os-release)
    OS_NAME=$(awk -F\= '/^NAME/ {print $2}' /etc/os-release)
    OS_VERSION=$(awk -F\" '/^VERSION=/ {print $2}' /etc/os-release)
    OS_VERSION_CODENAME=$(awk -F\" '/^VERSION_CODENAME/ {print $2}' /etc/os-release)
    OS_VERSION_ID=$(awk -F\= '/^VERSION_ID/ {print $2}' /etc/os-release)
elif [ "$OS_KERNEL" = "OpenBSD" ]; then
    OS_ID=$(sysctl -n kern.ostype | awk '{print tolower($0)}')
    OS_NAME=$(sysctl -n kern.ostype)
    OS_VERSION=$(sysctl -n kern.osrelease)
    OS_VERSION_CODENAME=$(sysctl -n kern.osrelease)
    OS_VERSION_ID=$(sysctl -n kern.osrelease)
else
    OS_ID="unknown"
    OS_NAME="unknown"
    OS_VERSION="unknown"
    OS_VERSION_CODENAME="unknown"
    OS_VERSION_ID="unknown"
fi

export OS_ID OS_NAME OS_VERSION OS_VERSION_CODENAME OS_VERSION_ID
