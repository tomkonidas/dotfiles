set nocompatible

syntax on
filetype plugin indent on
set encoding=utf-8

let mapleader ="\<space>"

set hidden
set nu
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
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
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set splitbelow splitright
set conceallevel=0
set path=.,,**
set wildmenu
set wildmode=longest,list,full
set wildignore+=*/node_modules/*

set cursorline
highlight ColorColumn ctermbg=0 guibg=lightgrey


if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

let g:polyglot_disabled = ['javascript']

" Plugins ---
call plug#begin('~/.local/share/nvim/site/plugged')
" Tools
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-eunuch'
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-mapping-mark-children.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'unblevable/quick-scope'
    Plug 'mattn/emmet-vim'
    Plug 'mhinz/vim-mix-format'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'slashmili/alchemist.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-scripts/AutoComplPop'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'ntpeters/vim-better-whitespace'
" Syntax
    Plug 'elixir-editors/vim-elixir'
    Plug 'sheerun/vim-polyglot'
    Plug 'yuezk/vim-js'
    Plug 'direnv/direnv.vim'
" Color-schemes
    Plug 'morhetz/gruvbox'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif
try
    colorscheme gruvbox
catch
    colorscheme peachpuff
endtry

set background=dark

au! BufWritePost $MYVIMRC source %

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1

  noremap <silent> <Leader><Enter> :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> k <Plug>(fern-action-mark-toggle)
  nmap <buffer> K <Plug>(fern-action-mark-children:leaf)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


" Close a buffer
nnoremap <leader>q :bd<CR>

" Toggle through buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Compile PDF files on write
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1"
autocmd BufRead,BufNewFile *.tex setlocal spell

" Elixir
let g:mix_format_on_save = 1

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Move viusal selections
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Remap split nav to CTRL + <h,j,k,l>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt + hjkl or arrow keys to resize windows
nnoremap <M-j>   :resize -2<CR>
nnoremap <M-k>   :resize +2<CR>
nnoremap <M-h>   :vertical resize -2<CR>
nnoremap <M-l>   :vertical resize +2<CR>

" Toggle between vertical and horizontal split
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" turn off search highlight
nnoremap <leader><space> :let @/=''<CR>

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Trigger Omnicomplete
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <C-j> pumvisible() ? "<C-n>" :"<C-j>"
inoremap <expr> <C-k> pumvisible() ? "<C-p>" : "<C-k>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <C-l> pumvisible() ? "<C-y>" : "<C-l>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" Quick-Scope: Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" FZF
nmap <leader>f :Files<CR>
nmap <leader>g :GFiles<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Sinppets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Better whitespace
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_on_save=1
