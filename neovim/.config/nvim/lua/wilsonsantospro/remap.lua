-- vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('v', '<C-X>', '"+x')
vim.keymap.set('v', '<C-C>', '"+y')
vim.keymap.set('v', '<C-V>', '"+gP')

-- terminal
vim.keymap.set('t', '<C-w>N', '<C-\\><C-N>')
vim.keymap.set('i', '<C-w>w', '<C-\\><C-N><C-w>w')
--vim.keymap.set('t',
vim.keymap.set('t', '<A-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('t', '<A-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('t', '<A-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('t', '<A-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('i', '<A-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set('i', '<A-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set('i', '<A-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set('i', '<A-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

-- easier moving of code blocks
-- Try to go into visual mode (v), thenselect several lines of code here and
-- then press ``>`` several times.
vim.keymap.set('v', '<', '<gv')  -- better indentation
vim.keymap.set('v', '>', '>gv')  -- better indentation
