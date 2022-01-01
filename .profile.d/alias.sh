#!/usr/bin/env sh
#
# Copyright (c) 2022 Johnathan C Maudlin <jcmdln@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

[ -n "$(command -v rsync)" ] && alias rsync="\rsync -achzP"
[ -n "$(command -v unzip)" ] && alias unzip="\unzip -q"

if [ "$OS_KERNEL" = "Linux" ]; then
    alias dd="\dd status=progress"
    alias ls="\ls -F"
    alias mkdir="\mkdir -p"

    if [ "$SHELL" != "/bin/ash" ]; then
        alias df="\df -h"
        alias free="\free -h"
        alias grep="\grep --color=auto"
        alias ln="\ln -i"
        alias ls="\ls -hv --color=auto --group-directories-first"
        alias mv="\mv -i"
        alias rm="\rm -i"
        alias tree="\tree -C --dirsfirst"
    fi
elif [ "$OS_KERNEL" = "OpenBSD" ]; then
    alias df="\df -h"
    alias du="\du -h"
    alias ls="\ls -hCF"
    alias mkdir="\mkdir -p"
    alias mv="\mv -i"
    alias openrsync="\openrsync --rsync-path=openrsync -lrtv"

    [ -n "$(command -v tree)" ] && alias tree="\tree -F"
fi
