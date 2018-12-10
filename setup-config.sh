#!/usr/bin/env sh

dirs_create="
    /home/$USER/.config
    /home/$USER/.local/bin
"
for dir in $dirs_create; do
    [ ! -d $dir ] && rm -rf $dir
    [ ! -e $dir ] && mkdir $dir
done

dirs_remove="
    /home/$USER/.emacs.d
    /home/$USER/.config/i3
    /home/$USER/.profile.d
    /home/$USER/.vim
"
for dir in $dirs_remove; do
    [ -e $dir ] && rm -rf $dir
done

ln -sf $(pwd)/etc/bash/bashrc                     ~/.bashrc
ln -sf $(pwd)/etc/emacs                           ~/.emacs.d
ln -sf $(pwd)/etc/i3                              ~/.config/i3
ln -sf $(pwd)/etc/i3status.conf                   ~/.i3status.conf
ln -sf $(pwd)/etc/profile                         ~/.profile
ln -sf $(pwd)/etc/profile.d                       ~/.profile.d
ln -sf $(pwd)/etc/tmux.conf                       ~/.tmux.conf
ln -sf $(pwd)/etc/vim                             ~/.vim
ln -sf $(pwd)/etc/xinitrc                         ~/.xinitrc
ln -sf $(pwd)/usr/local/bin/srandr                ~/.local/bin/srandr
ln -sf $(pwd)/usr/share/themes/gtk-2.0/gtkrc-2.0  ~/.gtkrc-2.0
ln -sf $(pwd)/usr/share/themes/gtk-3.0            ~/.config/gtk-3.0
