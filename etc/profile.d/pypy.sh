# /etc/profile.d/pypy.sh

if [ -x $(command -v pypy2) ]; then
    alias pyp="pypy2 -m pip --disable-pip-version-check"
fi

if [ -x $(command -v pypy3) ]; then
    alias pyp="pypy3 -m pip --disable-pip-version-check"
fi
