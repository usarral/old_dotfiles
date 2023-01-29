#!/bin/sh

# systray battery icon
cbatticon -u 5 &
# systray volume
volumeicon&
# nm-applet &
xinput set-prop 11 307 1
export XDG_RUNTIME_DIR=$HOME/.config/$(id -u)
