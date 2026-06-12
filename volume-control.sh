#!/bin/sh
case "$1" in
    up)   pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
    down) pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
esac
vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')
dunstify --stack-tag=volume "Volume" "$vol"
