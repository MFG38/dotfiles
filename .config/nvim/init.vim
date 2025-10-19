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
Plug 'crispgm/nvim-tabline'
call plug#end()

""" Basic settings

set title
set showtabline=2

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

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

vim.lsp.enable('clangd')
vim.lsp.enable('pylsp')

require("lualine").setup {
	options = {
		theme = 'dracula'
	}
}
require("nvim-cursorline").setup()
require("tabline").setup({})

