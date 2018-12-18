# /etc/profile.d/racket.sh

if [ -d ~/.local/racket ]; then
    export PATH="$PATH:~/.local/racket/bin"
    export MANPATH="$MANPATH:~/.local/racket/man"
fi
