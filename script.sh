#!/bin/bash

pacman -S efibootmgr networkmanager intel-ucode nvidia-dkms git base-devel neofetch --noconfirm && systemctl enable NetworkManager

uuid=`blkid -s UUID -o value /dev/sda3`

echo root=UUID=$uuid rw  > /etc/kernel/cmdline

sed -i '/default_uki=/s/^#//g' /etc/mkinitcpio.d/linux-zen.preset

sed -i '/default_config=/s/^#//g' /etc/mkinitcpio.d/linux-zen.preset

sed -i '/default_options=/s/^#//g' /etc/mkinitcpio.d/linux-zen.preset

sed -i '/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/s/^#//g' /etc/sudoers

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

hwclock --systohc

echo LANG=pt_BR.UTF-8 > /etc/locale.conf

sed -i '/pt_BR.UTF-8 UTF-8/s/^#//g' /etc/locale.gen

locale-gen

echo KEYMAP=br-abnt2 > /etc/vconsole.conf

mkdir -p /efi/EFI/Linux

git clone https://aur.archlinux.org/paru-bin.git

mkinitcpio -P

useradd -m -G wheel,storage,power -s /bin/bash Jonathan

echo "123"| passwd -s 

echo "3006" | passwd -s Jonathan

efibootmgr -B -b 0000

efibootmgr -c -d /dev/sda -p 1 -L "Arch" -l "\EFI\Linux\arch-linux-zen.efi" -u
