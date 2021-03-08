syntax on

set exrc
set encoding=UTF-8
set noerrorbells
set relativenumber
set nu
set hidden
set mouse=a
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set scrolloff=8
set smartindent
set smartcase
set nowrap
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undodir
set clipboard+=unnamedplus
set undofile
set lazyredraw
set completeopt=menuone,noinsert,noselect
set updatetime=50
set shortmess+=c

set cursorline
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Install vim-plug if not found
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(glob(stdpath('data') . '/site/plugged'))
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'vim-utils/vim-man'
    Plug 'mbbill/undotree'
    Plug 'chaoren/vim-wordmotion'
    Plug 'mhinz/vim-mix-format'
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'mattn/emmet-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'ryanoasis/vim-devicons'
call plug#end()

if (has("termguicolors"))
  set termguicolors
endif
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

try
  colorscheme onedark
catch
  colorscheme peachpuff
endtry

set background=dark

let mapleader = " "

" Copy short filepath to clipboard
nmap <leader>cs :let @*=expand("%")<CR>
" Copy long filepath to clipboard
nmap <leader>cl :let @*=expand("%:p")<CR>
" Copy filename to clipboard
nmap <leader>cf :let @*=expand("%:t")<CR>

" Buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>q :bd<CR>
nnoremap <silent> <leader>b :Buffers<CR>

nnoremap <leader><space> :let @/=''<CR>

" Move viusal selections
vnoremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Toggle between vertical and horizontal split
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" Resize splits
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>rp :resize 100<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Toggle Spell-check
map <leader>o :setlocal spell! spelllang=en_us<CR>

let g:mix_format_on_save = 1

" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_preview_window = 'right:60%'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

nnoremap <silent> <leader>l :BLines<CR>

" Git
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nnoremap <leader>u :UndotreeShow<CR>

nnoremap <C-p> :Files<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Better whitespace
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_on_save=1

" Open config file from anywhere
nnoremap <leader>rc :e $MYVIMRC<CR>

" Source config
nnoremap <leader>so :source $MYVIMRC<cr>

" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC | echom "Sourced " . $MYVIMRC
