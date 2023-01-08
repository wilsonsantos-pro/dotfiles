fish_vi_key_bindings

set -g theme_display_git_default_branch yes
set -g theme_nerd_fonts yes
set -g theme_powerline_fonts yes
#set theme_color_scheme gruvbox
#theme_gruvbox dark soft

alias cddotfiles "cd ~/dotfiles/"
alias cdcosmicpython "cd ~/github/python_architecture_patterns_book/"

if status is-interactive
    set -l onedark_options '-b'

    if set -q VIM
        # Using from vim/neovim.
        set onedark_options "-256"
    else if string match -iq "eterm*" $TERM
        # Using from emacs.
        function fish_title; true; end
        set onedark_options "-256"
    end

    set_onedark $onedark_options
end
