#!/usr/bin/env sh

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
