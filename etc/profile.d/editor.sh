# /etc/profile.d/editor.sh

# Define the default editor. This will attempt to use Emacs, then Vim,
# then default to vi depending on which was located first.

if [ -x $(command -v emacs) ]; then
    EDITOR="emacsclient"
elif [ -x $(command -v vim) ]; then
    EDITOR="vim"
else
    EDITOR="vi"
fi

export EDITOR
