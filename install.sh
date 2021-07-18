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

install_package stow

stow tmux
stow vifm
stow vim

install_fish
