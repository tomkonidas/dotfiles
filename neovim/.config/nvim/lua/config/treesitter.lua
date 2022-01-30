require("nvim-treesitter.configs").setup(
    {
        ensure_installed = {
            "bash",
            "css",
            "dockerfile",
            "elixir",
            "heex",
            "html",
            "javascript",
            "json",
            "lua",
            "regex",
            "scss",
            "surface",
            "toml",
            "typescript",
            "vim",
            "yaml"
        },
        ignore_install = {}, -- List of parsers to ignore installing
        highlight = {
            enable = true, -- false will disable the whole extension
            disable = {} -- list of language that will be disabled
        },
        indent = {
            -- indentation based on treesitter for the = operator
            enable = true
        }
    }
)
