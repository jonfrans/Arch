#!/bin/bash

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/pacman.conf > /etc/pacman.conf

####### Instalação do yay ######
cp /etc/sudoers /sudoers.bak

echo "temp ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

useradd -m temp
echo 123 | passwd -s temp 

su -l temp

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin/
makepkg -si --noconfirm

userdel -r temp 

exit

mv /sudoers.bak /etc/sudoers
###### Fim ######
