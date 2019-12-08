set nocompatible


if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif


" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'elixir-lang/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'vim-airline/vim-airline'
call plug#end()

:map <C-c> "+y<CR>
:map <C-v> "+p<CR>

" Basics
syntax on
filetype plugin indent on
set encoding=utf-8
set nobackup
set nowritebackup

set number relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set ai
set expandtab
set smarttab
set hidden
set hlsearch
set nowrap
set nofoldenable

let mapleader =","

set background=dark
colorscheme koehler

" Elixir
let g:mix_format_on_save = 1


command WQ wq
command Wq wq
command W w
command Q q

