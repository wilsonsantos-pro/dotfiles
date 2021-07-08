#!/usr/bin/env bash
which stow || (echo "stow is not installed. Installing..." && sudo apt install stow -y)

stow tmux
stow vim
