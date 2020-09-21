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
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'mattn/emmet-vim'
    Plug 'mhinz/vim-mix-format'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Syntax
    Plug 'sheerun/vim-polyglot'
    Plug 'yuezk/vim-js'
" Color-schemes
    Plug 'dracula/vim'
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

" Javascript to tab at 2
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

" netrw --- 
" Open explorer netrw
" nnoremap <leader>e :Explore<CR>
:nmap <space>e :CocCommand explorer<CR>
let g:netrw_liststyle = 3
let g:netrw_home=$XDG_CACHE_HOME.'/.local/share/nvim/netrw'
" let g:netrw_banner = 0

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


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
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1"
autocmd BufRead,BufNewFile *.tex setlocal spell

" Elixir
let g:mix_format_on_save = 1
autocmd FileType elixir setlocal formatprg=mix\ format\ -

" Spellcheck for commits
autocmd FileType gitcommit setlocal spell

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

" FZF
nmap <leader>f :Files<CR> 
nmap <leader>g :GFiles<CR> 

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

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Coc Config
let g:coc_global_extensions = [
  \ 'coc-elixir',
  \ 'coc-explorer',
  \ 'coc-pairs',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-tsserver',
  \ 'coc-texlab'
  \]
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <C-f>  <Plug>(coc-format-selected)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
