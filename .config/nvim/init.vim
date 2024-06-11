""" init.vim
""" Santtu "MFG38" Pesonen

""" Plugins

call plug#begin()
Plug 'dracula/vim'
Plug 'williamboman/mason.nvim'
Plug 'nvim-lualine/lualine.nvim'
call plug#end()

""" Basic settings

set tabstop=4
set softtabstop=4
set shiftwidth=4

set incsearch
set hlsearch

set number
set relativenumber
set ignorecase

filetype plugin indent on
syntax on

""" Set color scheme

colorscheme dracula

""" Plugin configs

lua << EOF
require("mason").setup()
require("lualine").setup {
	options = {
		theme = 'dracula'
	}
}

