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

        use {
            "kdheepak/tabline.nvim",
            config = function()
                require "tabline".setup {
                    -- Defaults configuration options
                    enable = true,
                    options = {
                        -- If lualine is installed tabline will use separators configured in lualine by default.
                        -- These options can be used to override those settings.
                        section_separators = {"", ""},
                        component_separators = {"", ""},
                        max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
                        show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
                        show_devicons = true, -- this shows devicons in buffer section
                        show_bufnr = false, -- this appends [bufnr] to buffer section,
                        show_filename_only = true, -- shows base filename only instead of relative path in filename
                        modified_icon = "+ ", -- change the default modified icon
                        modified_italic = false -- set to true by default; this determines whether the filename turns italic if modified
                    }
                }
                vim.cmd [[
                  set guioptions-=e " Use showtabline in gui vim
                  set sessionoptions+=tabpages,globals " store tabpages and globals in session
                ]]
            end,
            requires = {{"hoob3rt/lualine.nvim", opt = true}, {"kyazdani42/nvim-web-devicons", opt = true}}
        }

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
