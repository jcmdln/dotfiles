#!/usr/bin/env sh

sudo dnf upgrade --best -y

sudo dnf install --best -y \
     https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
     https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install --best -y \
     arandr bind-utils bpftrace breeze-{cursor-theme,gtk,icon-theme} casync \
     chromium{,-libs-media-freeworld} clang clang-devel cloc cmake ctags \
     dnf-utils emacs geary gimp git gnome-terminal golang \
     google-noto-{cjk,emoji{,-color},sans,serif}-fonts htop i3{,lock,status} \
     iotop libreoffice lld lldb make mlocate mosh mpv nodejs pavucontrol \
     pciutils pipewire plasma-breeze pulseaudio{,-utils} rtags scrot tar time \
     tmux traceroute tree unzip usbutils whois x{init,randr,set} youtube-dl zip

if [ -d "~/Projects" ]; then
    mkdir -p ~/Projects
    git clone https://github.com/jcmdln/config ~/Projects/config
fi

[ -d "~/.config" ] &&
    mkdir -p ~/.config

targets="
~/.bash_profile
~/.bashrc
~/.emacs.d
~/.config/i3
~/.i3status.conf
~/.mpv
~/.profile
~/.profile.d
~/.tmux.conf
~/.vim
~/.xinitrc
~/.xsession
~/.zsh
"
for t in $targets; do
    [ -e "$t" ] && rm -rf "$t"
done

ln -sf ~/Projects/config/etc/bash/bash_profile ~/.bash_profile
ln -sf ~/Projects/config/etc/bash/bashrc ~/.bashrc
ln -sf ~/Projects/config/etc/emacs ~/.emacs.d
ln -sf ~/Projects/config/etc/i3 ~/.config/i3
ln -sf ~/Projects/config/etc/i3status.conf ~/.i3status.conf
ln -sf ~/Projects/config/etc/mpv ~/.mpv
ln -sf ~/Projects/config/etc/profile ~/.profile
ln -sf ~/Projects/config/etc/profile.d ~/.profile.d
ln -sf ~/Projects/config/etc/tmux.conf ~/.tmux.conf
ln -sf ~/Projects/config/etc/vim ~/.vim
ln -sf ~/Projects/config/etc/xinitrc ~/.xinitrc
ln -sf ~/Projects/config/etc/xsession ~/.xsession
ln -sf ~/Projects/config/etc/zsh ~/.zsh
