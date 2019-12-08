let mapleader =","


if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif


" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
call plug#end()


" Basics
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber

colorscheme pablo

