#!/usr/bin/env sh

packages_base="bind-utils connman dig dnf-utils git host htop linux-firmware mosh pciutils pipewire tmux traceroute unzip usbutils vim whois"
packages_desktop="arandr brightnessctl dmenu gnome-terminal i3 i3lock i3status mesa mesa-drm mpv scrot xrandr xset"
packages_extras="brave-browser chromium chromium-libs-media-freeworld emacs-nox google-noto-cjk-fonts steam wireguard"
packages_fonts="google-noto-emoji-fonts google-noto-mono-fonts google-noto-sans-fonts google-noto-serif-fonts"

services="connman"


sudo dnf upgrade -y

sudo dnf install -y \
     https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
     https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
     https://github.com/brave/brave-browser/releases/download/v0.57.18/brave-browser-0.57.18-1.x86_64.rpm \
     $packages_base $packages_desktop $packages_dev $package_extras $packages_fonts

sudo systemctl enable --now $services
