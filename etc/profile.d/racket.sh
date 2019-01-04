# /etc/profile.d/racket.sh

if [ -d "$HOME/.local/racket" ]; then
    # Ensure racket and raco are in PATH
    PATH="$PATH:$HOME/.local/racket/bin"
    MANPATH="$MANPATH:$HOME/.local/racket/man"

    # Load module directory
    RACKET_VERSION="$(racket --version|awk '{print substr($4, 1, length($4)-1)}')"
    export PATH="$PATH:$HOME/.racket/$RACKET_VERSION/bin"
    export MANPATH="$MANPATH:$HOME/.racket/$RACKET_VERSION/man"
fi
