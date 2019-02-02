#!/usr/bin/env sh
#
#
#
##

apk upgrade \
    || exit

apk add \
    arandr bind casync chromium connman dmenu docker emacs-nox git htop i3wm i3lock i3status linux-firmware mlocate mosh mpv pavucontrol pciutils pulseaudio pulseaudio-utils scrot sudo tmux traceroute tree unzip vim whois xinit xrandr xset youtube-dl zfs zfs-vanilla \
    || exit
