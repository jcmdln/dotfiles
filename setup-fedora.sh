#!/usr/bin/env sh
#
# This script is intended to be used after performing a fedora network
# install and choosing the base packages only. After the install has
# completed and you have rebooted into the new system, download and run
# this script.
#
##

## Switch to Fedora Rawhide
# sudo dnf install -y \
#      fedora-release-rawhide dnf-utils \
#      https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-rawhide.noarch.rpm
# sudo dnf config-manager --set-disabled fedora updates updates-testing
# sudo dnf config-managed --set-enabled rawhide
# sudo dnf update dnf
# sudo dnf -y --releasever=rawhide --setopt=deltarpm=false distro-sync --nogpgcheck

sudo dnf upgrade -y \
    || exit

sudo dnf install -y \
     https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
     https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
    || exit

sudo dnf install -y \
     arandr bind-utils bpftrace brave-browser breeze-cursor-theme breeze-gtk breeze-icon-theme brightnessctl casync chromium chromium-libs-media-freeworld connman dmenu dnf-utils docker emacs-nox git gnome-terminal gnome-terminal-nautilus google-noto-cjk-fonts google-noto-emoji-fonts google-noto-mono-fonts google-noto-sans-fonts google-noto-serif-fonts grub2-breeze-theme htop i3 i3lock i3status linux-firmware lxappearance mlocate mosh mpv nautilus pavucontrol pciutils pipewire plasma-breeze pulseaudio-utils scrot steam tmux traceroute tree unzip usbutils vim whois wireguard xinit xrandr xset \
    || exit

sudo systemctl enable --now \
     connman \
    || exit

sudo echo "GRUB_THEME=/boot/grub2/themes/breeze/theme.txt" >> /etc/default/grub
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
