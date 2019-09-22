# /etc/profile.d/pypy.sh

if [ -x $(command -v pypy) ]; then
    alias pyp="pypy -m pip --disable-pip-version-check"
fi

if [ -x $(command -v pypy2) ]; then
    alias pyp2="pypy2 -m pip --disable-pip-version-check"
fi

if [ -x $(command -v pypy3) ]; then
    alias pyp3="pypy3 -m pip --disable-pip-version-check"
fi
