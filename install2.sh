#!/bin/bash

###### Preparando o sistema ######

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

hwclock --systohc

###### Preparando a UKI ######
curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/pacman.conf > /etc/pacman.conf

uuid="$(blkid -s UUID -o value /dev/sda2)" 

echo root=UUID=$root rw rootfstype=xfs > /etc/kernel/cmdline

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/misc/linux-zen.preset > /etc/mkninitcpio.d/linux-zen.preset

mkdir -p /efi/EFI/Linux/

mkinitcpio -P

###### Fim ######

###### Instalação do yay ######
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
