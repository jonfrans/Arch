#!/bin/bash
	

while getopts id OPTION; do
    case $OPTION in
     i)
       pactl set-sink-volume @DEFAULT_SINK@ +2% 
       volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F"/" '{print $2}')
       notify-send -t 500  "$volume"
       ;;
     d)
       pactl set-sink-volume @DEFAULT_SINK@ -2%
       volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F"/" '{print $2}')
       notify-send -t 500 "$volume"
       ;;
    esac
done
