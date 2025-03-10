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

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/misc/numlock > /usr/local/bin/numlock

chmod +x /usr/local/bin/numlock

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/misc/numlock.service > /etc/systemd/system/numlock.service

###### Instalação de pacotes ######

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/misc/pacman.conf > /etc/pacman.conf

pacman -Syu efibootmgr networkmanager man intel-ucode power-profiles-daemon noto-fonts-emoji noto-fonts-cjk noto-fonts ttf-space-mono-nerd otf-font-awesome lib32-nvidia-utils wine wine-gecko wine-mono gamemode mangohud steam 7zip btop numlockx unrar --noconfirm 

systemctl enable NetworkManager

###### Fim ######

###### Preparando a UKI ######

uuid="$(blkid -s UUID -o value /dev/sda2)" 

echo root=UUID=$uuid rw rootfstype=xfs sysrq_always_enabled=1 intel_iommu=on > /etc/kernel/cmdline

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/misc/linux-zen.preset > /etc/mkinitcpio.d/linux-zen.preset

mkdir -p /efi/EFI/Linux/

mkinitcpio -P

###### Fim ######


###### Manutenção de usuário ######
useradd -m -G wheel -s /bin/bash jonathan

echo 123 | passwd -s

echo 3006 | passwd jonathan -s

gpasswd -a jonathan gamemode

###### Fim ######

mkinitcpio -P

efibootmgr -c -d /dev/sda -p 1 -L "Arch Linux" -l "\EFI\Linux\arch-linux-zen.efi" -u

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/DE.sh > /home/jonathan/de.sh
