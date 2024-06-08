""" init.vim
""" Santtu "MFG38" Pesonen

""" Plugins

call plug#begin()
Plug 'dracula/vim'
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

