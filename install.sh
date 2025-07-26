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
    # https://github.com/rkbk60/onedark-fish
    fisher install rkbk60/onedark-fish
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
    # install node, COC needs it
    install_package nodejs
    node --version

    install_package vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    vim +PlugInstall +qa
}

function install_nvim() {
    # install packer
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    pushd ./ansible/
    ansible-playbook -K playbooks/install-neovim-locally-playbook.yml
    popd

    install_package ripgrep
    install_package npm

    nvim +PackerInstall +qa
}

function install_pipx () {
    # install_package python3-pip
    # python3 -m pip install --user pipx
    install_package pipx
    python3 -m pipx ensurepath
}

function install_ansible () {
    pipx install ansible-lint
    pipx install --include-deps ansible
}

function install_tmux () {
    # install Tmux Plugin Manager: https://github.com/tmux-plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # install onedark colorscheme for tmux: https://github.com/odedlaz/tmux-onedark-theme
    echo "Open tmux.conf and then press 'prefix + I' to fetch the plugin"
}

## Start installation

install_package stow
install_package curl

stow kitty
stow neovim
stow tmux
stow vifm
stow vim

install_pipx
install_ansible
#install_fish
#install_kitty
install_vim
install_nvim
install_tmux

# caps lock -> escape
install_package dconf-cli
install_package dconf-editor
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

sudo apt install keepassx \
    vlc \
    diodon \
    kupfer \
    xfce4-terminal \
    cpufrequtils \
    htop \
    gnome-tweaks \
    -y

install_package gnome-browser-connector

# gnome-extensions
# https://extensions.gnome.org/extension/1460/vitals/

# gnome terminal one dark theme
# https://github.com/denysdovhan/one-gnome-terminal
bash -c "$(curl -fsSL https://raw.githubusercontent.com/denysdovhan/gnome-terminal-one/master/one-dark.sh)"

#https://www.hjdskes.nl/projects/gcolor3/
snap install gcolor3

# always show the universal access menu (useful when using tablet mode to enable onscreen keyboard)
gsettings set org.gnome.desktop.a11y always-show-universal-access-status true

# Touchscreen in Firefox
# https://askubuntu.com/questions/1122332/one-finger-scrolling-touchscreen-in-firefox
# * open about:config in firefox to set dom.w3c_touch_events.enabled=1 (default is 2).
# * edit /etc/security/pam_env.conf and add MOZ_USE_XINPUT2 DEFAULT=1
# * reboot and restart firefox
