# Set VIM as the default editor
cat /usr/share/applications/defaults.list | grep gedit | sed 's/gedit/gvim/g' >> ~/.local/share/applications/defaults.list
