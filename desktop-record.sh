#!/bin/bash

PIDFILE="/tmp/wf-recorder.pid"
DIR="$HOME/Videos"

if [ -f "$PIDFILE" ]; then
    kill -INT "$(cat "$PIDFILE")"
    rm "$PIDFILE"
    notify-send "Recording saved" "$FILENAME"
    exit 0
fi

GEOMETRY=$(slurp) || exit 1
AUDIO=$(pactl get-default-sink).monitor
FILENAME="$DIR/recording-$(date +%Y-%m-%d-%s).mp4"

notify-send -t 900 "Recording in 2..."
sleep 1
notify-send -t 900 "Recording in 1..."
sleep 1

wf-recorder -r 60 -g "$GEOMETRY" --audio="$AUDIO" -f "$FILENAME" &
echo $! > "$PIDFILE"
