#!/bin/bash

###### Preparando o sistema ######

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

hwclock --systohc

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/misc/locale.gen > /etc/locale.gen

locale-gen

echo LANG=pt_BR.UTF-8 > /etc/locale.conf

echo KEYMAP=br-abnt2 > /etc/vconsole.conf

echo archlinux > /etc/hostname

mkdir -p /etc/X11/xorg.conf.d/

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/misc/00-keyboard.conf > /etc/X11/xorg.conf.d/00-keyboard.conf

###### Instalação de pacotes ######
curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/misc/pacman.conf > /etc/pacman.conf

pacman -Syu efibootmgr  networkmanager man intel-ucode power-profiles-daemon --noconfirm

pacman -S noto-fonts-emoji noto-fonts-cjk noto-fonts ttf-space-mono-nerd otf-font-awesome --noconfirm

pacman -S lib32-nvidia-utils wine wine-gecko wine-mono gamemode mangohud steam --noconfirm

pacman -S 7zip btop numlockx  --noconfirm

systemctl enable NetworkManager

###### Fim ######

###### Preparando a UKI ######

uuid="$(blkid -s UUID -o value /dev/sda2)" 

echo root=UUID=$uuid rw rootfstype=xfs > /etc/kernel/cmdline

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/misc/linux-zen.preset > /etc/mkinitcpio.d/linux-zen.preset

mkdir -p /efi/EFI/Linux/

mkinitcpio -P

###### Fim ######


###### Manutenção de usuário ######
echo "Adicione uma senha para o root:"
read -s root

while [ -z $root  ]; do
  read -sp "Insira um valor para a senha do root" root
done

echo $root | passwd -s

read -p "Digite o nome do usuário:" user

useradd -m -G wheel -s /bin/bash $user

read -sp "Digite a senha do usuário:" senha

echo $senha | passwd $user -s

echo $user > /user.txt

echo "$user ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers


###### Fim ######

bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/uefi.sh)
