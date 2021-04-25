local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Git
  use 'tpope/vim-fugitive'

  -- Toggle comments
  use 'tpope/vim-commentary'

  -- Automatically add end after def, do, etc.
  use 'tpope/vim-endwise'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'

  -- Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use 'chaoren/vim-wordmotion'

  use 'tpope/vim-surround'

  use 'ntpeters/vim-better-whitespace'

  -- Languages
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'sheerun/vim-polyglot'
  use 'mhinz/vim-mix-format'
  use 'mattn/emmet-vim'

  -- Colors
  use 'joshdick/onedark.vim'
end)
