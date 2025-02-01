#!/bin/bash 

rofi=$(echo -e '󰑐\n⏻' | rofi -dmenu)


case $rofi in
    󰑐)
      reboot
      ;;
    ⏻)
      poweroff
      ;;
esac

