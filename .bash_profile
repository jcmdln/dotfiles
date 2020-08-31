#!/usr/bin/env bash

# This file only exists for ensuring that bashrc gets loaded. I don't
# care about any formal distinction between these files in terms of how
# configuration is to be performed, and put everything in a
# shell-agnostic ~/.profile or other such configuration.

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi