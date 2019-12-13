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
Plug 'tpope/vim-endwise'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'raimondi/delimitmate'
Plug 'sheerun/vim-polyglot'
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'flazz/vim-colorschemes'
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
" Enable autocompletion:
set wildmode=longest,list,full
set number
set relativenumber
" set colorcolumn=+1
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
set ignorecase
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

" Safety net for powerline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Elixir ---
let g:mix_format_on_save = 1

" Stop highlighting on Enter
map <esc> :noh<CR>

" Copy/Paste to system Clipboard
map <C-c> "+y<CR>
map <C-v> "+p<CR>

" Opps ---
command WQ wq
command Wq wq
command W w
command Q q

" Find a document
nmap <leader>f :find<space> 

" Choose a buffer
nnoremap <leader>b :buffers<CR>:buffer<Space>
" Toggle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Autocomplete spell in Insert Mode
set complete+=kspell

" Compile PDF files on write
autocmd BufWritePost *.tex :Latexmk
autocmd BufRead,BufNewFile *.tex setlocal spell

" Spellcheck for commits
autocmd FileType gitcommit setlocal spell

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright
