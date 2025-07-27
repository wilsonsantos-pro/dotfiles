local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use("sainnhe/gruvbox-material")
    use("navarasu/onedark.nvim")
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })

    use({ "theprimeagen/harpoon" })
    use({ "voldikss/vim-floaterm" })
    use({ "tpope/vim-fugitive" })
    use({ "tpope/vim-commentary" })
    use({ "tpope/vim-surround" })
    use({ "qpkorr/vim-bufkill" })

    use({ "preservim/nerdtree" })
    use({ "ryanoasis/vim-devicons" })
    use({ "Xuyuanp/nerdtree-git-plugin" })
    use({ "airblade/vim-gitgutter" })

    -- Extra syntax
    use({ "sophacles/vim-bundle-mako" }) -- mako templates syntax
    use({ "pearofducks/ansible-vim" })   -- helps identify with filetype yaml.ansible
    -- consider using: https://github.com/sheerun/vim-polyglot

    use({ "AckslD/nvim-pytrize.lua" })

    use({ "kenn7/vim-arsync" }) -- async remote file transfer

    -- DAP
    use({ "mfussenegger/nvim-dap" })
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
    use({ "mfussenegger/nvim-dap-python" })

    -- COC
    -- use {'neoclide/coc.nvim', branch = 'release'}

    -- Cmp
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")

    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("nvimtools/none-ls.nvim")
    use("RRethy/vim-illuminate")
    use("folke/neodev.nvim")

    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })

    use("schickling/vim-bufonly")
end)
