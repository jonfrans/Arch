#!/bin/bash

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
