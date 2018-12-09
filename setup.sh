#!/usr/bin/env sh

dirs="~/.config"
for dir in $dirs; do
    if [ ! -d "$dir" ]; then
	mkdir ~/.config
    fi
done

ln -sf $(pwd)/etc/bash/bashrc                     ~/.bashrc
ln -sf $(pwd)/etc/emacs                           ~/.emacs.d
ln -sf $(pwd)/etc/i3                              ~/.config/i3
ln -sf $(pwd)/etc/i3status.conf                   ~/.i3status.conf
ln -sf $(pwd)/etc/profile                         ~/.profile
ln -sf $(pwd)/etc/profile.d                       ~/.profile.d
ln -sf $(pwd)/etc/tmux.conf                       ~/.tmux.conf
ln -sf $(pwd)/etc/vim/vimrc                       ~/.vimrc
ln -sf $(pwd)/etc/xinitrc                         ~/.xinitrc
ln -sf $(pwd)/usr/local/bin/srandr                ~/.local/bin/srandr
ln -sf $(pwd)/usr/share/themes/gtk-2.0/gtkrc-2.0  ~/.gtkrc-2.0
ln -sf $(pwd)/usr/share/themes/gtk-3.0            ~/.config/gtk-3.0

sudo echo "GRUB_THEME=\"/boot/grub2/themes/breeze/theme.txt\"" >> /etc/default/grub
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
