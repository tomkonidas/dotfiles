require("nvim-treesitter.configs").setup(
    {
        ensure_installed = {
            "bash",
            "c",
            "comment",
            "cpp",
            "css",
            "dockerfile",
            "eex",
            "elixir",
            "erlang",
            "gitignore",
            "heex",
            "html",
            "javascript",
            "json",
            "latex",
            "lua",
            "make",
            "markdown",
            "markdown_inline",
            "proto",
            "regex",
            "scss",
            "sql",
            "toml",
            "typescript",
            "vim",
            "zig",
            "yaml"
        },
        highlight = {enable = true, additional_vim_regex_highlighting = false},
        incremental_selection = {enable = true},
        indent = {enable = true},
        textobjects = {enable = true}
    }
)
