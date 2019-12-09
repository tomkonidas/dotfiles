set nocompatible

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Plugins ---
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
call plug#end()


" Basics ---
syntax on
let mapleader =","
filetype plugin on
filetype indent on
set encoding=utf-8
set nobackup
set nowritebackup
set path=.,,**
set wildmenu

set number
set relativenumber
set cursorline
set tabstop=2
set shiftwidth=2
set softtabstop=2
set ai
set expandtab
set smarttab
set hidden
set incsearch
set hlsearch
set smartcase
set nowrap
set nofoldenable
set scrolloff=999


set background=dark
set termguicolors
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE

" netrw --- 
" Open explorer netrw
nnoremap <leader>e :Explore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Airline ---
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Elixir ---
let g:mix_format_on_save = 1

" Stop highlighting on Enter
map <CR> :noh<CR>

" Copy/Paste to system Clipboard
map <C-c> "+y<CR>
map <C-v> "+p<CR>

" Opps ---
command WQ wq
command Wq wq
command W w
command Q q

" Format whole document
nmap <leader>f gg=G''

" Choose a buffer
nnoremap <leader>b :buffers<CR>:buffer<Space>
" Toggle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
