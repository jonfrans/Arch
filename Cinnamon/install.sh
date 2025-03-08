#!/bin/bash

sudo pacman -Syu cinnamon cinnamon-translations

echo "Você quer instalar o tema do linux mint?(Y/n)"
read tema

while true; do
case $tema in
  Y | y | "")
     yay -Syu mint-artwork --noconfirm
     sudo systemctl enable lightdm
     userdel -rf temp
     rm -rf /user.txt
     break
     ;;
  N | n)
     sudo pacman -Syu lightdm lightdm-gtk-greeter
     sudo systemctl enable lightdm
     userdel -rf temp
     rm -rf /user.txt
     break
     ;;
  *)
     echo "Insira uma opção valida(Y/n)"
     ;; 
esac
done

sudo su -
