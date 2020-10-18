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

OS_KERNEL="$(uname -s)"

if [ "$(uname -s)" = "Linux" ]; then
    OS_ID=$(grep "^ID=" /etc/os-release | awk -F\= '{print $2}')
    OS_NAME=$(grep "^NAME=" /etc/os-release | awk -F\" '{print $2}')
    OS_VERSION=$(grep "^VERSION=" /etc/os-release | awk -F\" '{print $2}')
    OS_VERSION_ID=$(grep "^VERSION_ID=" /etc/os-release | awk -F\" '{print $2}')
    OS_VERSION_CODENAME=$(grep "^VERSION_CODENAME=" /etc/os-release | awk -F\= '{print $2}')
elif [ "$(uname -s)" = "OpenBSD" ]; then
    OS_ID=$(sysctl -n kern.ostype | awk '{ print tolower($0) }')
    OS_NAME=$(sysctl -n kern.ostype)
    OS_VERSION=$(sysctl -n kern.osrelease)
    OS_VERSION_CODENAME=$(sysctl -n kern.osrelease)
    OS_VERSION_ID=$(sysctl -n kern.osrelease)
fi
