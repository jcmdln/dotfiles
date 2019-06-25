# /etc/profile.d/alias.sh

alias dd="dd status=progress"
alias df="df"
alias grep="grep"
alias ls="ls -F"
alias mkdir="mkdir -p"
alias mv="mv"
alias rm="rm"
alias rsync="rsync -haczP --ignore-existing"


# When on a Linux host that does not use busybox, add some additional
# GNU-only settings such as color output, interactive prompts, and other
# portability-devoid features.

if [ "$(uname -s)" = "Linux" ] && [ "$SHELL" != "/bin/ash" ]; then
    alias df="df -h"
    alias free="free -h"
    alias grep="grep --color=auto"
    alias ln="ln -i"
    alias ls="ls -h --color=auto --group-directories-first"
    alias mv="mv -i"
    alias rm="rm -i"
    alias tree="tree -C --dirsfirst"
fi
