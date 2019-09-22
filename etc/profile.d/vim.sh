#!/usr/bin/env sh
#
# Many operating systems provide vi, vim, and vimx packages, the latter
# of which is usually compiled with extras like clipboard support among
# other things. If vimx is present, then let's try to use it in place
# of vim.

if [ -n "$(command -v vimx)" ]; then
    alias vim="vimx"
fi
