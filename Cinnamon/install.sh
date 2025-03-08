#!/bin/bash

su -l temp

sudo pacman -Syu cinnamon cinnamon-translations

echo "Você quer instalar o tema do linux mint?(Y/n)"
read tema

while true; do
case $tema in
  Y | y | "")
     yay -Syu mint-artwork --noconfirm
     break
     ;;
  N | n)
     echo "Pulando essa etapa"
     break
     ;;
  *)
     echo "Insira uma opção valida(Y/n)"
     ;; 
esac
done
