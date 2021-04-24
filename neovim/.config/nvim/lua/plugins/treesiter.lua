require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    "lua",
    "html",
    "javascript",
    "json", 
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
