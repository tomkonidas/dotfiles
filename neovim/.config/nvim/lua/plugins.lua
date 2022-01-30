return require("packer").startup(
    function()
        -- Packer can manage itself
        use "wbthomason/packer.nvim"

        use {"tpope/vim-fugitive", event = "VimEnter"}
        use {"tpope/vim-commentary", event = "VimEnter"}
        use {"tpope/vim-surround", event = "VimEnter"}

        -- Show git change (change, delete, add) signs in vim sign column
        use {"mhinz/vim-signify", event = "BufEnter"}

        use {
            "neovim/nvim-lspconfig",
            event = "VimEnter",
            config = [[require('config.lsp')]],
            requires = {
                {"glepnir/lspsaga.nvim"},
                {"nvim-lua/completion-nvim"}
            }
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            event = "BufEnter",
            run = ":TSUpdate",
            config = [[require('config.treesitter')]]
        }

        use {"sheerun/vim-polyglot"}

        use {"chaoren/vim-wordmotion", event = "BufEnter"}

        use {"rrethy/nvim-base16", event = "VimEnter"}

        use {
            "hoob3rt/lualine.nvim",
            requires = {
                "kyazdani42/nvim-web-devicons",
                opt = true
            },
            config = [[require('config.lualine')]]
        }

        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                opt = true
            },
            event = "BufEnter",
            config = [[require('config.telescope')]]
        }
    end
)
