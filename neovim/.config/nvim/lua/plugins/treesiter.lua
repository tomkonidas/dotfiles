require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "lua",
    "comment",
    "regex",
    "scss",
    "bash",
    "html",
    "javascript",
    "json",
    "jsonc",
    "css",
    "toml",
    "yaml"
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.elixir = {
  install_info = {
    url = "https://github.com/wingyplus/tree-sitter-elixir",
    files = {"src/parser.c"},
    branch = "main"
  }
}
