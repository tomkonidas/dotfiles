set nocompatible

syntax on
filetype plugin on
filetype indent on
set encoding=utf-8

let mapleader ="\<space>"

set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undodir
set undofile
set incsearch
set lazyredraw
set cursorline
set showcmd
set showmatch
set clipboard+=unnamedplus
set iskeyword+=-
set mouse=a 
set formatoptions-=cro
set splitbelow splitright
set conceallevel=0
set path=.,,**
set wildmenu
set wildmode=longest,list,full

set colorcolumn=80
set cursorline
highlight ColorColumn ctermbg=0 guibg=lightgrey


if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Plugins ---
call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'morhetz/gruvbox'

call plug#end()

try
    colorscheme gruvbox
catch
    colorscheme peachpuff
endtry

set background=dark

au! BufWritePost $MYVIMRC source %

" netrw --- 
" Open explorer netrw
nnoremap <leader>e :Explore<CR>
let g:netrw_liststyle = 3
let g:netrw_home=$XDG_CACHE_HOME.'/.local/share/nvim/netrw'

" let g:netrw_banner = 0

" Find a document
nmap <leader>f :find<space> 

nnoremap rm :!rm %
cmap w!! w !sudo tee %

" Close a buffer
nnoremap <leader>q :bd<CR>

" Choose a buffer
nnoremap <leader>b :buffers<CR>:buffer<Space>

" Toggle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>


" Compile PDF files on write
autocmd BufWritePost *.tex :Latexmk
autocmd BufRead,BufNewFile *.tex setlocal spell

" Spellcheck for commits
autocmd FileType gitcommit setlocal spell

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Remap split nav to CTRL + <h,j,k,l>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Toggle between vertical and horizontal split
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
