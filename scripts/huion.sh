#!/bin/bash

pad_id=$(xsetwacom list | awk 'match($0, /id: ([0-9]+).*PAD/, a) {print a[1]}')
pen_stylus_id=$(xsetwacom list | awk 'match($0, /id: ([0-9]+).*STYLUS/, a) {print a[1]}')

# /usr/share/X11/xorg.conf.d/70-huion.conf
## Huion drawing tablet
#Section "InputClass"
#        Identifier "Huion drawing tablet"
#        #MatchProduct "HUION"
#        # idVendor=256c, idProduct=006d
##        MatchUSBID "256c:*"
#        MatchUSBID "256c:006d"
#        MatchDevicePath "/dev/input/event*"
#        Driver "wacom"
#EndSection



# reset
#xsetwacom set $pen_stylus_id Area "0 0 58752 33048"
#xsetwacom set 9 Area "-173 -240 58619 32768"
#
# Calibrate:
# * Disable the other outputs:
# $ xrandr --output DP-3 --off
# * Install xinput-calibrator:
# $ sudo apt install xinput-calibrator
# * Get MinX MinY MaxX MaxY from:
# $ xinput_calibrator --device $pen_stylus_id
xsetwacom set $pen_stylus_id Area "-143 -217 58650 32729"

xsetwacom set $pad_id "Button" "12" "key ctrl z"

xsetwacom set $pen_stylus_id MapToOutput HDMI-1
