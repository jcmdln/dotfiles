#!/usr/bin/env sh
#
# This script is intended to be used after performing a fedora network
# install and choosing the base packages only. After the install has
# completed and you have rebooted into the new system, download and run
# this script.
#
##

printf "setup: Starting system upgrade... "
sudo dnf upgrade -y \
     > /dev/null 2>&1 \
    || exit
printf "done\n"


printf "setup: Adding RPM-Fusion repositories... "
sudo dnf install -y \
     https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
     https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
     > /dev/null 2>&1 \
    || exit 1
printf "done\n"


printf "setup: Installing base packages"
sudo dnf install -y \
     bpftrace chromium{,-libs-media-freeworld} cloc connman dmenu dnf-utils docker emacs git gnome-terminal golang htop i3{,lock,status} linux-firmware mlocate nodejs pavucontrol pciutils pipewire plasma-breeze pulseaudio{,-utils} pypy3{,-{devel,libs}} scrot tmux tree unzip usbutils vim-X11 x{init,randr,set} \
     > /dev/null 2>&1 \
    || exit 1
printf "done\n"


read -p "setup: Install laptop packages? [y/n]: " MULTIMEDIA_PROMPT
if echo "$MULTIMEDIA_PROMPT" | grep -iq "^y"; then
    printf "setup: Adding laptop packages... "
    sudo dnf install -y \
	 brightnessctl \
	 > /dev/null 2>&1 \
	|| exit 1
    printf "done\n"
fi


read -p "setup: Install multimedia packages? [y/n]: " MULTIMEDIA_PROMPT
if echo "$MULTIMEDIA_PROMPT" | grep -iq "^y"; then
    printf "setup: Adding Multimedia packages... "
    sudo dnf install -y \
	 ardour5 blender krita hydrogen mpv \
	 > /dev/null 2>&1 \
	|| exit 1
    printf "done\n"
fi


read -p "setup: Install additional networking packages? [y/n]: " NETWORKING_PROMPT
if echo "$NETWORKING_PROMPT" | grep -iq "^y"; then
    printf "setup: Adding additional networking packages... "
    sudo dnf install -y \
	 bind-utils casync mosh traceroute whois wireguard \
	 > /dev/null 2>&1 \
	|| exit 1
    printf "done\n"
fi


read -p "setup: Install additional theme packages? [y/n]: " NETWORKING_PROMPT
if echo "$NETWORKING_PROMPT" | grep -iq "^y"; then
    printf "setup: Adding theme packages... "
    sudo dnf install -y \
	 breeze-{cursor-theme,gtk,icon-theme} google-noto-{cjk,emoji{,-color},mono,sans,serif}-fonts grub2-breeze-theme \
	 > /dev/null 2>&1 \
	|| exit 1

    if [ -e "/etc/default/grub" ] && [ -e "/boot/grub2/themes/breeze/theme.txt" ]; then
	sudo echo "GRUB_THEME=/boot/grub2/themes/breeze/theme.txt" >> /etc/default/grub
	sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg > /dev/null 2>&1
    fi
    printf "done\n"
fi


printf "setup: Starting services... "
sudo systemctl enable --now \
     connman \
     > /dev/null 2>&1 \
    || exit 1
printf "done\n"
