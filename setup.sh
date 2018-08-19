#!/usr/bin/env sh

## Local user installation

mkdir -p \
      ~/.config/i3 \
      ~/.bin

ln -sf $(pwd)/etc/emacs/default.el ~/.emacs.el
ln -sf $(pwd)/etc/vim/vimrc ~/.vimrc
ln -sf $(pwd)/etc/tmux.conf ~/.tmux.conf
ln -sf $(pwd)/etc/xinitrc ~/.xinitrc
ln -sf $(pwd)/etc/i3/config ~/.config/i3/config
ln -sf $(pwd)/etc/i3status.conf ~/.i3status.conf
ln -sf $(pwd)/usr/local/bin/srandr ~/.bin/srandr
