nnoremap <silent> <Space> <nop>
let mapleader = " "

lua require('plugins')

" -----------------------------------------------------------------------------
" Colors
" -----------------------------------------------------------------------------

set termguicolors
set cursorline
set background=dark
colorscheme onedark
set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey


" Plugin Config
lua require('plugins.lspconfig')
lua require('plugins.treesiter')
lua require('plugins.telescope')
lua require('plugins.gitsigns')
lua require('plugins.colorizer')

set exrc
set noerrorbells

set number
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set ignorecase
set smartcase
set scrolloff=8
set nowrap
set mouse=a
set hidden
set nobackup
set noswapfile
set undofile
set undodir=~/.local/share/nvim/undodir
set clipboard+=unnamedplus


" -----------------------------------------------------------------------------
" Key mappings
" -----------------------------------------------------------------------------


" COMPLETION
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Manually trigger completion
imap <silent> <C-Space> <Plug>(completion_trigger)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" COMPLETION --


let g:mix_format_on_save = 1

" Better whitespace
let g:better_whitespace_enabled=0
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_on_save=1

" Explorer
nnoremap <silent> <Leader>e :Explore<CR>

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
nnoremap <silent> <Leader>gg :Git<CR>
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
map <silent> <CR> :nohl<CR>


" Toggle Spell-check
map <Leader>o :setlocal spell! spelllang=en_us<CR>

" LSP
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> [g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

command! -nargs=0 Format :lua vim.lsp.buf.formatting()

" -----------------------------------------------------------------------------
" Autocommands
" -----------------------------------------------------------------------------

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
autocmd FocusGained,BufEnter * :checktime

" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC | echom "Sourced " . $MYVIMRC
