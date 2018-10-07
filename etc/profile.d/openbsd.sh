# /etc/profile.d/openbsd.sh

if [ "$(uname)" == "OpenBSD" ]; then
    ## Add Xenocera to PATH and MANPATH
    export PATH="$PATH:/usr/X11R6/bin"
    export MANPATH="$MANPATH:/usr/X11R6/man"

    ## Set package sources URL
    export PKG_PATH="https://mirror.leaseweb.net/pub/OpenBSD/snapshots/packages/amd64"
    #export PKG_PATH="https://mirror.leaseweb.net/pub/OpenBSD/6.4/packages/amd64"
fi
