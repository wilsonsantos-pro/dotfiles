-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use 'sainnhe/gruvbox-material'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	use { 'theprimeagen/harpoon' }
    use { 'voldikss/vim-floaterm' }
	use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-commentary' }

    use { 'preservim/nerdtree' }
    use { 'ryanoasis/vim-devicons' }
    use { 'Xuyuanp/nerdtree-git-plugin' }
    use { 'airblade/vim-gitgutter' }

    use { 'sophacles/vim-bundle-mako' }  -- mako templates syntax

    use { 'AckslD/nvim-pytrize.lua' }

    -- DAP
    use { 'mfussenegger/nvim-dap' }
    use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }
    use { 'mfussenegger/nvim-dap-python' }

    -- COC
    -- use {'neoclide/coc.nvim', branch = 'release'}

    -- Cmp
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
	use "saadparwaiz1/cmp_luasnip"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"

	-- Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- LSP
	use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
	use "jose-elias-alvarez/null-ls.nvim"
    use "RRethy/vim-illuminate"
    use "folke/neodev.nvim"
end)
