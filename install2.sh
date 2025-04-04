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

pacman -Syu efibootmgr networkmanager man intel-ucode xorg-server power-profiles-daemon noto-fonts-emoji noto-fonts-cjk noto-fonts ttf-space-mono-nerd otf-font-awesome wine wine-gecko wine-mono gamemode mangohud 7zip btop numlockx unrar fastfetch winetricks firewalld --noconfirm 

systemctl enable NetworkManager

systemctl enable firewalld

###### Fim ######

###### Preparando a UKI ######

uuid="$(blkid -s UUID -o value /dev/sda2)" 

echo root=UUID=$uuid rw rootfstype=xfs sysrq_always_enabled=1 intel_iommu=on > /etc/kernel/cmdline

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/misc/linux.preset > /etc/mkinitcpio.d/linux.preset

mkdir -p /efi/EFI/Linux/

mkinitcpio -P

###### Fim ######

###### Chaotic aur ######
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo -e "[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
###### Fim ######

###### Configurando zram ######

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/misc/99-vm-zram-parameters.conf > /etc/sysctl.d/99-vm-zram-parameters.conf

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/misc/zram-generator.conf > /etc/systemd/zram-generator.conf

systemctl daemon-reload 

systemctl start systemd-zram-setup@zram0.service

###### Fim ######

###### Manutenção de usuário ######
useradd -m -G wheel -s /bin/bash jonathan

echo 123 | passwd -s

echo 3006 | passwd jonathan -s

gpasswd -a jonathan gamemode

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/misc/gamemode.ini > /etc/gamemode.ini

echo "jonathan ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

###### Fim ######

mkinitcpio -P

efibootmgr -B -b 0000

efibootmgr -c -d /dev/sda -p 1 -L "Arch Linux" -l "\EFI\Linux\arch-linux.efi" -u

curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/DE.sh > /home/jonathan/de.sh
