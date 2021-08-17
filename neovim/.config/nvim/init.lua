-- HELPERS --------------------------------------------------------------------
local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- PLUGINS --------------------------------------------------------------------
require('packer').startup(
  function()
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-endwise'
    use 'tpope/vim-surround'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'phaazon/hop.nvim'
    use 'itchyny/lightline.vim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'ntpeters/vim-better-whitespace'
    use 'airblade/vim-gitgutter'
    use 'chaoren/vim-wordmotion'
    use 'mattn/emmet-vim'
    use 'mhinz/vim-mix-format'
    use 'sheerun/vim-polyglot'
    use 'glepnir/zephyr-nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'kyazdani42/nvim-web-devicons'
  end
)

-- OPTIONS --------------------------------------------------------------------
local indent, width = 2, 80

g.mapleader = ' '

-- COLORSCHEME
require('zephyr')

opt('b', 'expandtab', true)                 -- Use spaces instead of tabs
opt('w', 'number', true)                    -- Show line numbers
opt('o', 'hidden', true)                    -- Enable background buffers
opt('b', 'shiftwidth', indent)              -- Size of an indent
opt('b', 'tabstop', indent)                 -- Number of spaces tabs count for
opt('b', 'softtabstop', indent)             -- Tab count while in edit
opt('b', 'textwidth', width)                -- Maximum width of text
opt('b', 'smartindent', true)               -- Insert indents automatically
opt('o', 'mouse', 'a')                      -- Enable mouse support
opt('o', 'ignorecase', true)                -- Ignore case in search patterns
opt('o', 'smartcase', true)                 -- Override ignorecase uppercase
opt('o', 'scrolloff', 12)                   -- Lines of context
opt('o', 'termguicolors', true)             -- True color support
opt('o', 'swapfile', false)                 -- Disable swap files
opt('w', 'colorcolumn', tostring(width))    -- Line length marker
opt('w', 'cursorline', true)                -- Highlight cursor line
opt('w', 'signcolumn', 'yes')               -- Show sign column
opt('w', 'wrap', false)                     -- Disable line wrap
opt('b', 'undofile', true)                  -- Enable undo files
opt('o', 'clipboard', 'unnamedplus')        -- Share system clipboard
opt('o', 'updatetime', 100)                 -- Faster buffer updates
opt('o', 'showmode', false)                 -- Remove default MODE in status

-- MAPPINGS -------------------------------------------------------------------
map('n', [[<C-\>]], '<cmd>nohlsearch<CR>')
map('n', '<Leader>vh', '<cmd>Telescope help_tags<CR>')
map('n', '<Leader>vm', '<cmd>Telescope man_pages<CR>')
map('n', '<Leader>vv', '<cmd>Telescope vim_options<CR>')
map('n', '<Leader>vr', '<cmd>Telescope registers<CR>')
map('n', '<Leader>vk', '<cmd>Telescope keymaps<CR>')

-- SEARCH AND NAVIGATION
map('n', '<Leader><Space>', '<cmd>Telescope git_files<CR>')
map('n', '<Leader>/', '<cmd>Telescope live_grep<CR>')
map('n', '<Leader>,', '<cmd>Telescope buffers<CR>')
map('n', '<Leader>b/', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
map('n', '<Leader>fe', '<cmd>Telescope file_browser<CR>')
map('n', '<Leader>fr', '<cmd>Telescope oldfiles<CR>')
map('n', '<Leader>ff', '<cmd>Telescope find_files<CR>')

-- SELECT ALL
map('n', '<C-a>', 'ggVG<CR>')

-- SUBSTITUTE
map('n', 'S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {silent = false})

-- MOVE VISUAL SELECTION
map('v', 'K', ':move \'<-2<CR>gv=gv')
map('v', 'J', ':move \'>+1<CR>gv=gv')

-- BETTER TABBING
map('v', '<', '<gv')
map('v', '>', '>gv')

-- COMPLETION
map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true})
map('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true})

-- ESCAPE
map('i', 'jj', '<ESC>')
map('i', 'jk', '<ESC>')
map('i', 'kj', '<ESC>')
map('t', '<ESC>', '<C-\\><C-n>')

-- BUFFERS
map('n', '<Leader>q', '<cmd>bdelete<CR>')
map('n', '<Leader>bd', '<cmd>bdelete<CR>')
map('n', '<Leader>b[', '<cmd>bprevious<CR>')
map('n', '<Tab>', '<cmd>bprevious<CR>')
map('n', '<Leader>b]', '<cmd>bnext<CR>')
map('n', '<S-Tab>', '<cmd>bnext<CR>')

-- WINDOW
map('n', '<C-h>', '<cmd>wincmd h<CR>', {noremap = false})
map('n', '<C-j>', '<cmd>wincmd j<CR>', {noremap = false})
map('n', '<C-k>', '<cmd>wincmd k<CR>', {noremap = false})
map('n', '<C-l>', '<cmd>wincmd l<CR>', {noremap = false})
-- TOGGLE BETWEEN VERTICAL AND HORIZONTAL SPLIT
map('n', '<Leader>th', '<C-w>t<C-w>H', {noremap = false})
map('n', '<Leader>tk', '<C-w>t<C-w>K', {noremap = false})
-- RESIZE SPlITS
map('n', '<S-Left>', '<C-w>2<')
map('n', '<S-Down>', '<C-w>2-')
map('n', '<S-Up>', '<C-w>2+')
map('n', '<S-Right>', '<C-w>2>')

-- LSP
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<C-f>', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<Leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map("n", "<c-k>", '<cmd>lua vim.lsp.buf.signature_help()<cr>')
map('n', '<Leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<Leader>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

-- NETRW
map('n', '<Leader>e', '<cmd>Explore<CR>')

-- GIT
map('n', '<Leader>gg', '<cmd>Git<CR>')
map('n', '<Leader>gp', '<cmd>Git push<CR>')
map('n', '<leader>gb', '<cmd>Git blame<CR>')
map('n', '<leader>gd', '<cmd>Gvdiffsplit<CR>')
map('n', '<leader>gf', '<cmd>GitGutterFold<CR>')
map('n', '<Leader>gc', '<cmd>Telescope git_commits<CR>')
map('n', '<Leader>gC', '<cmd>Telescope git_bcommits<CR>')
map('n', '<Leader>gl', '<cmd>Telescope git_branches<CR>')

-- TOGGLE SPELL-CHECK
map('', '<Leader>o', '<cmd>setlocal spell! spelllang=en_us<CR>')

-- PLUGIN SETTINGS ------------------------------------------------------------

-- Elixir
g.mix_format_on_save = 1

-- GITGUTTER
g.gitgutter_max_signs = -1

-- TREE-SITTER
require 'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {enable = true},
  indent = {enable = true}
}

-- TELESCOPE
require('telescope').load_extension('fzy_native')

-- COLORIZER
require('colorizer').setup({
  'css',
  'scss',
  'javascript',
  'html',
  'eelixir',
  'erb'
})

-- BETTER WHITESPACE
g.better_whitespace_enabled = 0
g.strip_whitespace_confirm = 0
g.strip_whitelines_at_eof = 1
g.strip_whitespace_on_save = 1

-- LSP
local lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

for ls, cfg in pairs({
  bashls = {},
  cssls = {
    capabilities = capabilities
  },
  elixirls = {
    capabilities = capabilities,
    cmd = {vim.loop.os_homedir().."/.local/share/elixir-ls/language_server.sh"},
    settings = {
      elixirLS = {
        dialyzerEnabled = false,
        fetchDeps = false
      }
    }
  },
  efm = {
    capabilities = capabilities,
    filetypes = {"elixir"}
  },
  html = {
    capabilities = capabilities,
    filetypes = {"html", "eelixir"}
  },
  tsserver = {}
}) do lsp[ls].setup(cfg) end

-- COMPE
opt('o', 'shortmess', vim.o.shortmess..'c')
opt('o', 'completeopt', 'menuone,noinsert,noselect')

map('i', '<C-Space>', 'compe#complete()', {expr = true, silent = false})
map('i', '<C-e>', [[compe#close('<C-e>')]], {expr = true})
map('i', '<C-f>', [[compe#scroll({ 'delta': +4 })]], {expr = true})
map('i', '<C-d>', [[compe#scroll({ 'delta': -4 })]], {expr = true})

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'disabled';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;
  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    spell = true;
    tags = true;
  };
}

-- HOP ------------------------------------------------------------------------
require'hop'.setup({ keys = 'etovxqpdygfblzhckisuran' })

map('n', '<Leader>w', "<cmd>lua require'hop'.hint_words()<cr>")
map('n', '<Leader>l', "<cmd>lua require'hop'.hint_lines()<cr>")

-- LIGHTLINE ------------------------------------------------------------------
g.lightline = {
  colorscheme = 'one',
  active = {
    left = {
      {'mode', 'paste'},
      {'readonly', 'filename', 'modified'}
    },
    right = {
      {'lineinfo'},
      {'percent'},
      {'gitbranch', 'filetype'}
    }
  },
  component_function = {
    gitbranch = 'FugitiveHead'
  }
}
