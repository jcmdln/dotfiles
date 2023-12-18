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

export MYPY_CACHE_DIR="$XDG_CACHE_HOME/mypy"
export RUFF_CACHE_DIR="$XDG_CACHE_HOME/ruff"
export PIP_DISABLE_PIP_VERSION_CHECK="true"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"
export PYTHON_KEYRING_BACKEND="keyring.backends.null.Keyring"
