#!/usr/bin/env bash

function install_package() {
    package_name=$1
    (which ${package_name} > /dev/null && \
        echo "${package_name} is already installed" ) \
        || (echo "${package_name} is not installed. Installing..." \
        && sudo apt install ${package_name} -y)
}

function install_fish() {
    install_package fish
    grep "^$USER" /etc/passwd | grep fish > /dev/null || chsh -s /usr/bin/fish
    # install Fira Code nerd fonts
    # set -g theme_nerd_fonts yes
    stow fish

    # Themes:
    # 1) install oh-my-fish
    # curl -L https://get.oh-my.fish | fish
    # 2) install bobthefish
    # omf install bobthefish
    # fish_config colors
}

function install_kitty() {
    # https://sw.kovidgoyal.net/kitty/binary/#binary-install
    curl -s -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    # Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
    # your PATH)
    ln -f -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
    # Place the kitty.desktop file somewhere it can be found by the OS
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    # Update the path to the kitty icon in the kitty.desktop file
    sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
}

function install_plug() {
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

## Start installation

install_package stow

stow kitty
stow tmux
stow vifm
stow vim

install_fish
install_kitty
install_plug

vim +PlugInstall +qa
