require('plugins')
require('keymaps')

local tokyonight_lualine_bold = true
vim.cmd('colorscheme tokyonight')
vim.cmd('set nocompatible')
vim.g.tokyonight_italic_functions = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 8 
vim.o.softtabstop = 8 
vim.o.tabstop = 8 

vim.opt.list = true
vim.opt.fillchars = { eob = "–", fold = " ", vert = "│", foldsep = " ", foldclose = "", foldopen = "" }
vim.opt.listchars:append({ tab = " ", lead = "·", trail = "·", eol = "﬋" })

vim.o.background = 'dark'
vim.o.breakindent = true
vim.o.clipboard = 'unnamedplus'
vim.o.cursorline = true
vim.o.hidden = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.inccommand = 'nosplit'
vim.o.mouse = 'a'
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.wildmenu = true
vim.opt.undofile = true
vim.wo.number = true
vim.wo.relativenumber = true

require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = 'tokyonight',
	}
})

require('nvim-treesitter.configs').setup({
	ensure_installed = "all",
	sync_install = false,
	highlight = {
		enable = true
	},
	indent = {
		enable = true
	}
})

require('nvim-lsp-installer').on_server_ready(function(server)
	local opts = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim', 'use' }
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = {
						[vim.fn.expand('$VIMRUNTIME/lua')] = true,
						[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
					}
				}
			},
			ltex = {
				language = "fr"
			},
		}
	}
	server:setup(opts)
end)

require('nvim-autopairs').setup({
	check_ts = true,
})

require('telescope').setup({
	defaults = {
		file_ignore_patterns = { "^%.git/" }
	}
})
