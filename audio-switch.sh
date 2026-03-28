#!/bin/sh
SPEAKERS="alsa_output.pci-0000_2f_00.4.analog-stereo"
EARBUDS="alsa_output.usb-Synaptics_MEZE_AUDIO-00.analog-stereo"

current=$(pactl get-default-sink)

if [ "$current" = "$SPEAKERS" ]; then
    pactl set-default-sink "$EARBUDS"
    notify-send "Selected: Earbuds"
else
    pactl set-default-sink "$SPEAKERS"
    notify-send "Selected: Speakers"
fi

