#!/bin/bash

sudo pacman -Syu cinnamon cinnamon-translations

yay -Syu mint-artwork --noconfirm
sudo systemctl enable lightdm

sudo su -l  -c bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/uefi.sh)
