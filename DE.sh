#!/bin/bash

rm -rf ~/de.sh

###### Instalação do yay ######
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin/
makepkg -si --noconfirm

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
###### Fim ######

echo "Você deseja usar:"
echo "[1] Hyprland"
echo "[2] KDE Plasma"
echo "[3] Gnome"
echo "[4] Cinnamon"
echo "[5] i3"
read DE
while true;do
case $DE in
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
      bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/Cinnamon/install.sh)
      break
      ;;
     5)
      bash <(curl -s https://raw.githubusercontent.com/jonfrans/Arch/refs/heads/main/i3/install.sh)
      break
      ;;
     *)
      echo "Digite uma opção válida"
      ;;
esac
done
###### Fim ######
