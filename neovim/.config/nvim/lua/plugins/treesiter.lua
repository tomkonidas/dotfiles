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
