#!/usr/bin/env sh
#
# This script is intended to be used after performing a fedora network
# install and choosing the base packages only. After the install has
# completed and you have rebooted into the new system, download and run
# this script.
#
##


sudo dnf upgrade -y \
    || exit

sudo dnf install -y \
     https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
     https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
     https://github.com/brave/brave-browser/releases/download/v0.57.18/brave-browser-0.57.18-1.x86_64.rpm \
    || exit

sudo dnf install -y \
     arandr bind-utils brave-browser breeze breeze-cursor-theme breeze-gtk breeze-icon-theme brightnessctl chromium chromium-libs-media-freeworld connman dmenu dnf-utils emacs-nox git gnome-terminal gnome-terminal-nautilus google-noto-cjk-fonts google-noto-emoji-fonts google-noto-mono-fonts google-noto-sans-fonts google-noto-serif-fonts grub2-breeze-theme htop i3 i3lock i3status linux-firmware lxappearance mlocate mosh mpv nautilus pavucontrol pciutils pipewire plasma-breeze pulseaudio-utils scrot steam tmux traceroute tree unzip usbutils vim whois wireguard xinit xrandr xset \
    || exit

sudo systemctl enable --now \
     connman \
    || exit
