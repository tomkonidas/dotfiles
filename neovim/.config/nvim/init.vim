" -----------------------------------------------------------------------------
" Plugin 
" -----------------------------------------------------------------------------

:lua require('plugins')

" -----------------------------------------------------------------------------
" Colors
" -----------------------------------------------------------------------------

set termguicolors
set cursorline
" set colorcolumn=80
colorscheme dracula
set background=dark
highlight ColorColumn ctermbg=0 guibg=lightgrey


" Plugin Config
:lua require('plugins.lspconfig')
:lua require('plugins.compe')
:lua require('plugins.treesiter')

set exrc
set noerrorbells

set number
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set scrolloff=8
set nowrap
set mouse=a
set hidden
set nobackup
set noswapfile
set undofile
set undodir=~/.local/share/nvim/undodir
set clipboard+=unnamedplus

" Performance
set lazyredraw
set updatetime=50




" -----------------------------------------------------------------------------
" Key mappings
" -----------------------------------------------------------------------------

" Leader
nnoremap <silent> <Space> <nop>
let mapleader = " "

" Explorer
nnoremap <silent> <Leader>e :Lexplore<CR>

" Buffers
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
nnoremap <silent> <Leader>q :bdelete<CR>

" Better window movement
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Toggle between vertical and horizontal split
nmap <Leader>th <C-w>t<C-w>H
nmap <Leader>tk <C-w>t<C-w>K

" Alternative ways to Escape
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>
tnoremap jk <C-\><C-n>
tnoremap kj <C-\><C-n>
tnoremap jj <C-\><C-n>
tnoremap <Esc> <C-\><C-n>

" Select all
nnoremap <silent> <C-a> ggVG<CR>

" Git
nnoremap <silent> <Leader>gs :Git<CR>
nnoremap <silent> <Leader>gp :Git push<CR>

" Move visual selections
vnoremap <silent> K :move '<-2<CR>gv=gv
vnoremap <silent> J :move '>+1<CR>gv=gv

" Better tabbing
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" Clear highlighted search results
nnoremap <silent> <Leader><Space> :let @/=""<CR>

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" Toggle Spell-check
map <Leader>o :setlocal spell! spelllang=en_us<CR>

" LSP
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" -----------------------------------------------------------------------------
" Autocommands
" -----------------------------------------------------------------------------

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
autocmd FocusGained,BufEnter * :checktime

" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC | echom "Sourced " . $MYVIMRC
