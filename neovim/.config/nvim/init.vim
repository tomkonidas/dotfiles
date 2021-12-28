let mapleader = " "

set mouse=a
set nobackup
set noswapfile
set undofile
set showmatch
set wildmenu
set scrolloff=12
set shiftwidth=2
set smarttab
set tabstop=2
set softtabstop=2
set expandtab
set smartindent
set copyindent
set ignorecase
set smartcase
set number
set cursorline
set noshowmode
set nowrap
set clipboard+=unnamedplus
set pumheight=10
set shortmess+=c
set completeopt=menuone,noinsert,noselect

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function LoadPlugins()
  " Install packer.nvim if not found
  let packer_path = stdpath('data') . '/site/pack/packer/start/packer.nvim'
  if empty(glob(packer_path))
    let packer_repo = 'https://github.com/wbthomason/packer.nvim'
    silent execute '!git clone --depth 1 ' . packer_repo . ' ' . packer_path
    echo "Installing packer.nvim..."
    autocmd VimEnter * PackerSync | source $MYVIMRC
  endif
  lua require('plugins')
endfunction

call LoadPlugins()

if (has("termguicolors"))
  set termguicolors
endif

packadd! nvim-base16
colorscheme base16-onedark

" Format the whole file by default
nnoremap <Leader>g mzgggqG`z

" Delete buffer
nnoremap <silent> <Leader>q :bdelete<CR>

" vim-signify
let g:signify_vcs_list = ['git']
let g:signify_sign_change = '~'

" Netrw
nnoremap <silent> <Leader>e :Explore<CR>

" Telescope
function ProjectFiles()
  silent! !git rev-parse --is-inside-work-tree
  if v:shell_error == 0
    :Telescope git_files
  else
    :Telescope find_files
  endif
endfunction

nnoremap <silent> <Leader><Space> :call ProjectFiles()<CR>
nnoremap <silent> <Leader>/ :Telescope live_grep<CR>
nnoremap <silent> <Leader>, :Telescope buffers<CR>

" Clear highlighted search
nmap <silent> <C-\> :nohlsearch<CR>

" Toggle Spell-check
map <Leader>o :setlocal spell! spelllang=en_us<CR>

" Move visual selections
vnoremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Fugitive
nnoremap <silent> <Leader>gg :Git<CR>
nnoremap <Leader>gp :Git push<CR>

" Set ripgrep as the grep command
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Trailing whitespace
match ErrorMsg '\s\+$'
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

autocmd BufWritePre * :call TrimWhiteSpace()

" Automatically source vimrc on save.
autocmd! BufWritePost $MYVIMRC source $MYVIMRC | echom "Sourced " . $MYVIMRC
