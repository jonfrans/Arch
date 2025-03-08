#!/bin/bash

sudo pacman -Syu cinnamon cinnamon-translations

yay -Syu mint-artwork --noconfirm

sudo systemctl enable lightdm

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/misc/lightdm.conf > /etc/lightdm.conf
