#!/bin/bash

rofi="$(pidof rofi)"

if [ $rofi != ""  ]; then
     kill $rofi
else
     bash ~/.config/rofi/launchers/type-6/launcher.sh
fi
