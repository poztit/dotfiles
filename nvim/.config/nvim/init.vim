"
" Neovim configuration file
" Author : François Illien <francois@illien.org>
"

""" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

""" Declare the list of plugins.
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""" List ends here. Plugins becom visible to Neovim after this call.
call plug#end()

""" Support true colors
set termguicolors

""" Set gruvbox config
set background=dark
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_italic = '1'
let g:gruvbox_italicize_comments = '1'
let g:gruvbox_bold = '1'
colorscheme gruvbox

""" Configure autocompletion
let g:coc_global_extensions = [
  \ 'coc-vimlsp',
  \ ]

""" Configure Latex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'mupdf'


""" Configure global settings
filetype plugin indent on
syntax on
set title

set number
set relativenumber
set ruler
set cursorline
set encoding=utf-8

set smartindent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Indentation level indicator
let g:indentLine_char = '|'
 
