-- Install packer. You don't have to necessarily understand this code. Just know that it will grab packer from the Internet and install it for you.
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
  ]],
  false
)

-- Here we can declare the plugins we'll be using.
local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim'    -- Package manager itself.
 	use 'neovim/nvim-lspconfig' 	-- Collection of configurations for built-in LSP client.
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'windwp/nvim-autopairs'
	use 'williamboman/nvim-lsp-installer'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'folke/tokyonight.nvim'
	use { -- UI to select things (files, search results, open buffers...)
		'nvim-telescope/telescope.nvim',
                tag = "nvim-0.6",
		requires = { 'nvim-lua/plenary.nvim' }
	}
	use { -- A bar that will show at the top of you nvim containing your open buffers. Similarly to how other editors show tabs with open files.
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}
 	use { -- A statuts line wrote in Lua.
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	} 
 	use { -- Adds git related info in the signs columns (near the line numbers) and popups.
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	use {
		"brymer-meneses/grammar-guard.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"williamboman/nvim-lsp-installer"
		}
	}
	use {
    		'goolord/alpha-nvim',
    		requires = { 'kyazdani42/nvim-web-devicons' },
    		config = function ()
        		require'alpha'.setup(require'alpha.themes.startify'.config)
    		end
	}
end)

require("nvim-treesitter.install").prefer_git = true
