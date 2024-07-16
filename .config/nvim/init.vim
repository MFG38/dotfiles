""" init.vim
""" Santtu "MFG38" Pesonen

""" Plugins

call plug#begin()
Plug 'dracula/vim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lualine/lualine.nvim'
Plug 'yamatsum/nvim-cursorline'
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
require("mason-lspconfig").setup()
require("lspconfig").pylsp.setup {}
require("lspconfig").clangd.setup {}

require("lualine").setup {
	options = {
		theme = 'dracula'
	}
}
require("nvim-cursorline").setup()

