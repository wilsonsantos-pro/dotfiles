#!/bin/bash
# Try to install i3wm with XFCE session

sudo apt install i3 nitrogen -y

# disable saved sessions
xfconf-query -c xfce4-session -p /general/SaveOnExit -n -t bool -s false
rm -rf $HOME/.cache/sessions/*

# set i3wm as default window manager
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -t string -sa xfsettingsd
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client1_Command -t string -sa i3
# nitrogen as the desktop
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client4_Command -t string -s nitrogen -t string -s --replace

# set xfwm4 as default window manager
#xfconf-query -c xfce4-session -p /sessions/Failsafe/Client1_Command -t string -sa xfwm4
# xfconf-query -c xfce4-session -p /sessions/Failsafe/Client4_Command -t string -sa xfdesktop

mkdir -p $HOME/.i3/
cp config $HOME/.i3/config
