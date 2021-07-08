#!/bin/bash

# mouse scrolling without raising
xfconf-query -c xfwm4 -p /general/raise_with_any_button -s false
# window buttons on the left side
#xfconf-query -c xfwm4 -p /general/button_layout -s "CMH|O"
# menus without images
#xfconf-query -c xsettings -p /Gtk/ButtonImages -s false
#xfconf-query -c xsettings -p /Gtk/MenuImages -s false
# shutdown without confirmation
#xfconf-query -c xfce4-panel -n -p /plugins/plugin-9/ask-confirmation -s false -t bool
# enable restart
#xfcommand="xfconf-query -c xfce4-panel -p /plugins/plugin-9/items"
#eval $xfcommand"$(eval $xfcommand | tail -11 | sed 's/-restart/+restart/' | awk '{printf " -t string -s %s", $1}')"
# enable action buttons
#xfconf-query -c xfce4-panel -n -p /plugins/plugin-9/appearance -s 0 -t int
# enable editable accelerators
xfconf-query -c xsettings -p /Gtk/CanChangeAccels -s true

## keyboard shortcuts
function set_shortcut {
    key_comb=$1
    command=$2
    xfconf-query -c xfce4-keyboard-shortcuts -n -p "${key_comb}" -t string -s "${command}"
}

# snap
xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/<Super>Up" -t string -s "snap.py -m"
xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/<Super>Down" -t string -s "snap.py -u"
xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/<Super>Left" -t string -s "snap.py -x left -s half"
xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/<Super><Alt>Left" -t string -s "snap.py -x left -s onethird"
xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/<Super><Shift>Left" -t string -s "snap.py -x left -s twothirds"
xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/<Super>Right" -t string -s "snap.py -x right -s half"
xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/<Super><Alt>Right" -t string -s "snap.py -x right -s onethird"
xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/<Super><Shift>Right" -t string -s "snap.py -x right -s twothirds"

xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/F4" -t string -s "xfce4-terminal --drop-down"
xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/<Super>A" -t string -s "xfce4-popup-whiskermenu"

# workspace
set_shortcut "/xfwm4/custom/<Super>h" "left_workspace_key" 
set_shortcut "/xfwm4/custom/<Super>l" "right_workspace_key" 

set_shortcut "/xfwm4/custom/<Super>1" "workspace_1_key"
set_shortcut "/xfwm4/custom/<Super>2" "workspace_2_key"
set_shortcut "/xfwm4/custom/<Super>3" "workspace_3_key"
set_shortcut "/xfwm4/custom/<Super>4" "workspace_4_key"

set_shortcut "/xfwm4/custom/<Super><Shift>l" "move_window_right_workspace_key"
set_shortcut "/xfwm4/custom/<Super><Shift>h" "move_window_left_workspace_key"
set_shortcut "/xfwm4/custom/<Super><Shift>j" "move_window_down_workspace_key"
set_shortcut "/xfwm4/custom/<Super><Shift>k" "move_window_up_workspace_key"
set_shortcut "/xfwm4/custom/<Super><Shift>1" "move_window_workspace_1_key"
set_shortcut "/xfwm4/custom/<Super><Shift>2" "move_window_workspace_2_key"
set_shortcut "/xfwm4/custom/<Super><Shift>3" "move_window_workspace_3_key"
set_shortcut "/xfwm4/custom/<Super><Shift>4" "move_window_workspace_4_key"
# Assign Ctrl+Alt+Del to Task Manager
xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/<Primary><Alt>Delete" -t string -s "xfce4-taskmanager"
# Assign Ctrl+Alt+L to xflock4
xfconf-query -c xfce4-keyboard-shortcuts -n -p "/commands/custom/<Primary><Shift>l" -t string -s "xflock4"
