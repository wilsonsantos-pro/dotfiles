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

    curl -L https://get.oh-my.fish | fish

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

function install_vim() {
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    vim +PlugInstall +qa
}

function install_nvim() {
    # install packer
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    pushd ./ansible/
    ansible-playbook -K playbooks/install-neovim-locally.yml
    popd

    install_package ripgrep
}

function install_ansible () {
    pip install ansible-lint
}

## Start installation

install_package stow

stow kitty
stow neovim
stow tmux
stow vifm
stow vim

install_fish
install_kitty
install_vim
install_nvim

# caps lock -> escape
sudo apt install dconf-cli dconf-editor
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
