# ~/.profile.d/openbsd.sh

if [ "$(uname -s)" == "OpenBSD" ]; then
    # If present, add Xenocera to PATH and MANPATH
    if [ -d "/usr/X11R6" ]; then
        export PATH="$PATH:/usr/X11R6/bin"
        export MANPATH="$MANPATH:/usr/X11R6/man"
    fi

    # If present, add games to path
    if [ -d "/usr/games" ]; then
        export PATH="$PATH:/usr/games"
    fi
fi
