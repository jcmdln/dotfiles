# ~/profile.d/editor.sh

if [ -x "$(command -v emacs)" ]; then
    EDITOR="emacsclient"
elif [ -x "$(command -v vim)" ]; then
    EDITOR="vim"
elif [ -x "$(command -v vi)" ]; then
    EDITOR="vi"
fi

export EDITOR
