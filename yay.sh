#!/bin/bash

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin/
makepkg -si --noconfirm

yay -Syu systemd-numlockontty --noconfirm

sudo systemctl enable numLockOnTty

sudo su - -c bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/DE.sh) 
