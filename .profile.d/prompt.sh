#!/usr/bin/env sh
#
# Copyright (c) 2020 Johnathan C Maudlin <jcmdln@gmail.com>
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

export PROMPT_COMMAND="history -a"

if [ -n "$ZSH_VERSION" ]; then
    PS1="[%n@%m %1~]$ "

    if [ -n "$DISPLAY" ] || [ -n "$SSH_TTY" ]; then
        precmd() {
            print -Pn "\[\e];%n@%m %~\a\]"
        }
    fi
else
    PS1="[\u@\h \W]\$ "

    if [ -n "$DISPLAY" ] || [ -n "$SSH_TTY" ]; then
        PS1="\[\e];\u@\h: \w\a\]$PS1"
    fi
fi

export PS1
export PS2="> "
