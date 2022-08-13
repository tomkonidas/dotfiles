require("nvim-treesitter.configs").setup(
    {
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "css",
            "dockerfile",
            "eex",
            "elixir",
            "erlang",
            "graphql",
            "heex",
            "html",
            "javascript",
            "json",
            "latex",
            "lua",
            "make",
            "regex",
            "scss",
            "surface",
            "toml",
            "typescript",
            "vim",
            "zig",
            "yaml"
        },
        highlight = {enable = true},
        incremental_selection = {enable = true},
        indent = {enable = true},
        textobjects = {enable = true}
    }
)
