#!/usr/bin/env sh

sudo dnf upgrade --best -y

sudo dnf install --best -y \
     https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
     https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install --best -y \
     bind-utils bpftrace casync clang clang-devel cloc cmake ctags docker dnf-utils emacs gimp git golang google-noto-{cjk,emoji{,-color},sans,serif}-fonts iftop iotop lld lldb make mlocate mosh mpv nodejs pciutils pipewire pulseaudio{,-utils} rtags scrot tar time tmux traceroute tree unzip usbutils whois youtube-dl zip

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

#ln -sf ~/Projects/config/etc/bash/bash_profile ~/.bash_profile
#ln -sf ~/Projects/config/etc/bash/bashrc ~/.bashrc
ln -sf ~/Projects/config/etc/emacs ~/.emacs.d
ln -sf ~/Projects/config/etc/mpv ~/.mpv
#ln -sf ~/Projects/config/etc/profile ~/.profile
#ln -sf ~/Projects/config/etc/profile.d ~/.profile.d
