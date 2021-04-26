-- Elixir
require'lspconfig'.elixirls.setup{
  cmd = { vim.loop.os_homedir().."/.cache/nvim/ls/elixir-ls/language_server.sh" };
}

-- HTML
local html_capabilities = vim.lsp.protocol.make_client_capabilities()
html_capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = html_capabilities,
 }

require'lspconfig'.tsserver.setup{}

local css_capabilities = vim.lsp.protocol.make_client_capabilities()
css_capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  capabilities = css_capabilities,
}

require'lspconfig'.stylelint_lsp.setup{
  settings = {
    stylelintplus = {
      autoFixOnFormat = true,
      autoFixOnSave = true,
      validateFixOnFormat = true,
      validateFixOnSave = true
    }
  }
}

require'lspconfig'.bashls.setup{}

require'lspconfig'.yamlls.setup{}

require'lspconfig'.dockerls.setup{}
