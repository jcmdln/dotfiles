#!/usr/bin/env sh

# In this section we will ensure that the required directories do in
# fact exist in the state we expect them to. This requires us to remove
# and/or create directories to allow us to symlink configuration files
# into place.

dirs_remove="
    /home/$USER/.emacs.d
    /home/$USER/.config/i3
    /home/$USER/.profile.d
    /home/$USER/.vim
"
for dir in $dirs_remove; do
    [ -e $dir ] && rm -rf $dir
done


dirs_create="
    /home/$USER/.config
    /home/$USER/.config/gtk-3.0
    /home/$USER/.local/bin
    /home/$USER/.local/etc
    /home/$USER/.local/lib
    /home/$USER/.local/man
    /home/$USER/.local/share
"
for dir in $dirs_create; do
    [ ! -d $dir ] && rm -rf $dir
    [ ! -e $dir ] && mkdir -p $dir
done


# Now we'll individually symlink each directory or specific
# configuration file into place.

ln -si $(pwd)/etc/bash/bashrc                          ~/.bashrc
ln -si $(pwd)/etc/bash/bash_profile                    ~/.bash_profile
ln -si $(pwd)/etc/emacs                                ~/.emacs.d
ln -si $(pwd)/etc/i3                                   ~/.config/i3
ln -si $(pwd)/etc/i3status.conf                        ~/.i3status.conf
ln -si $(pwd)/etc/profile                              ~/.profile
ln -si $(pwd)/etc/profile.d                            ~/.profile.d
ln -si $(pwd)/etc/tmux.conf                            ~/.tmux.conf
ln -si $(pwd)/etc/vim                                  ~/.vim
ln -si $(pwd)/etc/xinitrc                              ~/.xinitrc

ln -si $(pwd)/usr/local/bin/srandr                     ~/.local/bin/srandr
ln -si $(pwd)/usr/share/themes/gtk-2.0/gtkrc-2.0       ~/.gtkrc-2.0
ln -si $(pwd)/usr/share/themes/gtk-3.0/settings.ini    ~/.config/gtk-3.0/settings.ini
