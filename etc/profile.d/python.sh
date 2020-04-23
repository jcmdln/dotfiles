#!/usr/bin/env sh

PIP_OPTS="--disable-pip-version-check"

if [ -x "$(command -v pip)" ]; then
    alias pip="pip $PIP_OPTS"
fi

if [ -x "$(command -v pip2)" ]; then
    alias pip2="pip2 $PIP_OPTS"
fi

if [ -x "$(command -v pip3)" ]; then
    alias pip3="pip3 $PIP_OPTS"
fi

unset PIP_OPTS
