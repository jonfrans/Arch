#!/bin/bash

sudo pacman -Syu cinnamon cinnamon-translations

echo "Você quer instalar o tema do linux mint?(Y/n)"
read tema

yay -Syu mint-artwork --noconfirm
sudo systemctl enable lightdm

sudo su - -c bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/uefi.sh)
