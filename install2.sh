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

###### Instalação do yay ######
cp /etc/sudoers /sudoers.bak

echo "temp ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

useradd -m temp
echo 123 | passwd -s temp 

su -l temp -c bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/yay.sh)

mv /sudoers.bak /etc/sudoers
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

###### Selecionar o DE/WM ######

echo "Você deseja usar:"
echo "[0] Nenhuma"
echo "[1] Hyprland"
echo "[2] KDE Plasma"
echo "[3] Gnome"
echo "[4] Cinnamon"
read DE
while true;do
case $DE in
    0)
      continue
      ;;
    1)
      bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Hyprland/install.sh)
      break
      ;;
    2)
      bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/KDE/install.sh)
      break
      ;;
    3)
      bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Gnome/script.sh)
      break
      ;;
     4)
      bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/su-cinnamon.sh)
      break
      ;;
    *)
      echo "Digite uma opção válida"
      ;;
esac
done
###### Fim ######

userdel -rf temp
rm -rf /user.txt

###### Criação da entrada do sistema ######
mkinitcpio -P

efibootmgr -c -d /dev/sda -p 1 -L "Arch Linux" -l "\EFI\Linux\arch-linux-zen.efi" -u
###### Fim ######
