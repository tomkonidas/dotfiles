syntax on

set encoding=UTF-8
set noerrorbells
set relativenumber
set nu
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
set signcolumn=yes

set cursorline
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Install vim-plug if not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/site/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'vim-utils/vim-man'
    Plug 'mbbill/undotree'
    Plug 'bkad/camelcasemotion'
    Plug 'mhinz/vim-mix-format'
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'airblade/vim-gitgutter'
    Plug 'unblevable/quick-scope'
    Plug 'mattn/emmet-vim'
    Plug 'morhetz/gruvbox'
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

" Copy/Pasting
nnoremap <leader>d "_d
xnoremap <leader>d "_d
vnoremap <leader>p "_dP
"
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
nnoremap <silent> <Leader>b :Buffers<CR>

nnoremap <leader><space> :let @/=''<CR>

" Move viusal selections
xnoremap J :move '>+1<CR>gv-gv
xnoremap K :move '<-2<CR>gv-gv

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Toggle between vertical and horizontal split
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Resize splits
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Toggle Spell-check
map <leader>o :setlocal spell! spelllang=en_us<CR>


let g:netrw_browse_split = 4
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir='rm -r'

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

nnoremap <silent> <Leader>l :Lines<CR>

" Git
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>
nnoremap <Leader>gf :GFiles<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nnoremap <leader>u :UndotreeShow<CR>

nnoremap <C-p> :Files<CR>
" nnoremap <leader>e :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Quick-Scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Better whitespace
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_on_save=1

" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC | echom "Sourced " . $MYVIMRC
