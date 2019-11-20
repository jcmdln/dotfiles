#!/usr/bin/env sh

if [ -x "$(command -v pip)" ]; then
    alias pip="pip --disable-pip-version-check"
fi

if [ -x "$(command -v pip2)" ]; then
    alias pip2="pip2 --disable-pip-version-check"
fi

if [ -x "$(command -v pip3)" ]; then
    alias pip3="pip3 --disable-pip-version-check"
fi
