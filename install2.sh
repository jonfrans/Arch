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

pacman -S 7zip btop  --noconfirm

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
echo "Adicione uma senha para o root"
read root

while [ -z $root  ]; do
  echo "Insira um valor para a senha do root"
  read root
done

echo $root | passwd -s

echo "Digite o nome do usuário:"
read user

useradd -m -G wheel -s /bin/bash $user

echo "Digite a senha do usuário:"
read senha

echo $senha | passwd $user -s

echo $user > /user.txt

###### Fim ######

userdel -rf temp

bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/yay0.sh)
