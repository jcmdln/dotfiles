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
    || exit

sudo dnf install -y \
     bind-utils bpftrace breeze-{cursor-theme,gtk,icon-theme} brightnessctl casync chromium{,-libs-media-freeworld} cloc connman connman dmenu dnf-utils docker emacs git gnome-terminal go golang google-noto-{cjk,emoji{,-color},mono,sans,serif}-fonts grub2-breeze-theme htop i3{,lock,status} linux-firmware lxappearance mlocate mosh mosh mpv nodejs pavucontrol pciutils pipewire plasma-breeze pulseaudio{,-utils} pypy3{,-{devel,libs}} scrot tmux traceroute traceroute tree unzip usbutils vim-X11 whois wireguard x{init,randr,set} \
    || exit

sudo systemctl enable --now \
     connman \
    || exit

if [ -e "/etc/default/grub" ] && [ -e "/boot/grub2/themes/breeze/theme.txt" ]; then
    sudo echo "GRUB_THEME=/boot/grub2/themes/breeze/theme.txt" >> /etc/default/grub
    sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
fi
