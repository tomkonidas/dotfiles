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

let g:polyglot_disabled = ['javascript']

" Plugins ---
call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'yuezk/vim-js'
Plug 'morhetz/gruvbox'

call plug#end()

try
    colorscheme gruvbox
catch
    colorscheme peachpuff
endtry

set background=dark

au! BufWritePost $MYVIMRC source %

" Javascript to tab at 2
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" netrw --- 
" Open explorer netrw
nnoremap <leader>e :Explore<CR>
let g:netrw_liststyle = 3
let g:netrw_home=$XDG_CACHE_HOME.'/.local/share/nvim/netrw'
" let g:netrw_banner = 0

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

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

" coc config
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-json', 
  \ ]

" Add prettier if present in project
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
    let g:coc_global_extensions += ['coc-prettier']
endif

" Add eslint if present in project
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
    let g:coc_global_extensions += ['coc-eslint']
endif


" Show tool tip documentation and diagnostics
nnoremap <silent> K :call CocAction('doHover')<CR>

" Show tip on timer
function! ShowDocIfNoDiagnostic(timer_id)
    if (coc#util#has_float() == 0)
        silent call CocActionAsync('doHover')
    endif
endfunction

function! s:show_hover_doc()
    call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" coc Navigation

" definition, type definition and references
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" navigate  between errors
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Rename
nmap <leader>rn <Plug>(coc-rename)
