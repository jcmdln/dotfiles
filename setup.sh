#!/usr/bin/env sh

dirs="/home/$USER/.config"
for dir in $dirs; do
    if [ ! -d $dir ]; then
        mkdir $dir
    fi
done

ln -sf $(pwd)/etc/bash/bashrc                     ~/.bashrc
ln -sf $(pwd)/etc/emacs                           ~/.emacs.d

if [ -e /home/$USER/.config/i3 ]; then
    rm -rf /home/$USER/.config/i3
fi

ln -sf $(pwd)/etc/i3                              ~/.config/i3
ln -sf $(pwd)/etc/i3status.conf                   ~/.i3status.conf

if [ -e /home/$USER/.profile.d ]; then
    rm -rf /home/$USER/.profile.d
fi

ln -sf $(pwd)/etc/profile                         ~/.profile
ln -sf $(pwd)/etc/profile.d                       ~/.profile.d

ln -sf $(pwd)/etc/tmux.conf                       ~/.tmux.conf

if [ -e /home/$USER/.vim ]; then
    rm -rf /home/$USER/.vim
fi

ln -sf $(pwd)/etc/vim                             ~/.vim

ln -sf $(pwd)/etc/xinitrc                         ~/.xinitrc

if [ ! -e /home/$USER/.local/bin ]; then
    mkdir -p /home/$USER/.local/bin
fi

ln -sf $(pwd)/usr/local/bin/srandr                ~/.local/bin/srandr


#ln -sf $(pwd)/usr/share/themes/gtk-2.0/gtkrc-2.0  ~/.gtkrc-2.0
#ln -sf $(pwd)/usr/share/themes/gtk-3.0            ~/.config/gtk-3.0

#sudo echo "GRUB_THEME=\"/boot/grub2/themes/breeze/theme.txt\"" >> /etc/default/grub
#sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
