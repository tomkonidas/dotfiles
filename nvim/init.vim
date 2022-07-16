let mapleader = " "

set mouse=a
set noswapfile
set undofile
set showmatch
set scrolloff=8
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smartindent
set copyindent
set nowrap
set ignorecase
set smartcase
set number
set relativenumber
set cursorline
set nohlsearch
set shortmess+=c
set completeopt=menuone,longest
set laststatus=3
set updatetime=50

" Use <CR> to confirm selection
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

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

if has("termguicolors")
  set termguicolors
endif

" Color scheme
packadd! nvim-base16
colorscheme base16-onedark

"File Navigate
nnoremap <silent> <Leader><space> :call ProjectFiles()<CR>
nnoremap <silent> <Leader>e :Ex<CR>
nnoremap <silent> <Leader>v :Vex<CR>
nnoremap <silent> <Leader>, :Telescope buffers<CR>
nnoremap <silent> <Leader>/ :Telescope live_grep<CR>

let g:netrw_altfile = 1
let g:netrw_alto = 1

" Do not loose clipboard content on paste
vnoremap <Leader>p "_dP
" Yank to system clipbpard
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y
nnoremap <Leader>Y gg"+yG

" vim-signify
let g:signify_vcs_list = ['git']
let g:signify_sign_change = '~'

" Toggle Spell-check
map <Leader>o :setlocal spell! spelllang=en_us<CR>

" Move visual selections
vnoremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Git
nnoremap <silent> <Leader>gg :Git<CR>
nnoremap <Leader>gp :Git push<CR>

" Quickfix list
nnoremap <C-k> :cprev<CR>
nnoremap <C-j> :cnext<CR>

" Set ripgrep as the grep command
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

function ProjectFiles()
  silent! !git rev-parse --is-inside-work-tree
  if v:shell_error == 0
    :Telescope git_files
  else
    :Telescope find_files
  endif
endfunction

" Trailing whitespace
match ErrorMsg '\s\+$'
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

augroup ejson_ft
  au!
  autocmd BufNewFile,BufRead *.ejson set syntax=json
augroup END

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup="IncSearch", timeout = 40})
augroup END

" Automatically source vimrc on save.
autocmd! BufWritePost $MYVIMRC source $MYVIMRC | echom "Sourced " . $MYVIMRC
