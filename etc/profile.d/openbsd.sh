# /etc/profile.d/openbsd.sh

if [ "$(uname)" == "OpenBSD" ]; then
    ## Add Xenocera to PATH and MANPATH
    if [ -d "/usr/X11R6" ]; then
	export PATH="$PATH:/usr/X11R6/bin"
	export MANPATH="$MANPATH:/usr/X11R6/man"
    fi
fi
