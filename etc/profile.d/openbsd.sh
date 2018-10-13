# /etc/profile.d/openbsd.sh

if [ "$(uname)" == "OpenBSD" ]; then
    ## Add Xenocera to PATH and MANPATH
    if [ -d "/usr/X11R6" ]; then
	export PATH="$PATH:/usr/X11R6/bin"
	export MANPATH="$MANPATH:/usr/X11R6/man"
    fi

    ## Set package sources URL
    export PKG_PATH="https://mirror.leaseweb.net/pub/OpenBSD/$(uname -r)/packages/amd64"
fi
