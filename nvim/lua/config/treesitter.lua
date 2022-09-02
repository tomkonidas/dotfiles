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
            "heex",
            "html",
            "javascript",
            "json",
            "latex",
            "lua",
            "make",
            "regex",
            "scss",
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
