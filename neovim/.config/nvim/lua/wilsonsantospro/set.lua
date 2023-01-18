-- vim.opt.guicursor = ""
vim.opt.mouse = ""

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("let g:gruvbox_material_background = 'medium'")
vim.cmd("let g:gruvbox_material_better_performance = 1")
vim.cmd("colorscheme gruvbox-material")

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "88"

-- vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.shiftround = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50


-- auto reload
vim.cmd[[au BufWinEnter *.<fileextension> set updatetime=300 | set ft=<filetype>| set autoread]]
vim.cmd[[au CursorHold *.<fileextension>  checktime]]

-- Jump to the last position when reopening a file
vim.cmd[[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
