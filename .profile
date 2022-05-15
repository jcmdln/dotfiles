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

[ -f /etc/profile ] && . /etc/profile

# MANPATH="/usr/man:/usr/share/man:/usr/local/man:/usr/local/share/man"
# MANPATH="$MANPATH:$HOME/man:$HOME/.local/man:$HOME/.local/share/man"
# export MANPATH

# PATH="/sbin:/usr/sbin:/opt/sbin:/usr/local/sbin/"
# PATH="$PATH:/bin:/usr/bin:/opt/bin:/usr/local/bin"
# PATH="$PATH:$HOME/bin:$HOME/.local/bin"
# export PATH

export PAGER="less"
export PROMPT_COMMAND="history -a"

if [ -d "$HOME/.profile.d" ]; then
    for script in $HOME/.profile.d/*.sh; do
        [ -r "$script" ] && . "$script"
    done
fi
