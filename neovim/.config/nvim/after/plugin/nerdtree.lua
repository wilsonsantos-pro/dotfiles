vim.cmd [[
" Hide file in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"  Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
]]
--  Mirror the NERDTree before showing it. This makes it the same on all tabs.
vim.keymap.set('n', '<C-n>', ':NERDTreeMirror<CR>:NERDTreeToggle<CR>')
