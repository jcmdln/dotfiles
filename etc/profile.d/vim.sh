# /etc/profile.d/vim.sh

if [ ! -x $(command -v vimx) ]; then
    echo "found vimx"
    alias vim="vimx"
fi
