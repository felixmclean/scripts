#!/bin/sh
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
dunst &
keepassxc /home/felix/Documents/KeePass/Passwords.kdbx &
