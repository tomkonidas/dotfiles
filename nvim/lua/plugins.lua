return require("packer").startup(
    function()
        -- Packer can manage itself
        use "wbthomason/packer.nvim"

        use {"tpope/vim-fugitive", event = "VimEnter"}
        use {"tpope/vim-commentary", event = "VimEnter"}
        use {"tpope/vim-surround", event = "VimEnter"}
        use {"tpope/vim-projectionist", event = "VimEnter"}
        use {"tpope/vim-vinegar", event = "VimEnter"}

        -- Show git change (change, delete, add) signs in vim sign column
        use {"mhinz/vim-signify", event = "BufEnter"}

        use {
            "neovim/nvim-lspconfig",
            config = [[require('config.lsp')]]
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            event = "BufEnter",
            run = ":TSUpdate",
            config = [[require('config.treesitter')]]
        }

        use {"chaoren/vim-wordmotion", event = "BufEnter"}

        use {"rrethy/nvim-base16", event = "VimEnter"}

        use "nvim-lua/plenary.nvim"

        use {
            "nvim-telescope/telescope.nvim",
            event = "BufEnter",
            config = [[require('config.telescope')]]
        }
    end
)
