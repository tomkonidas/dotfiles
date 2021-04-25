-- Elixir
require'lspconfig'.elixirls.setup{
  cmd = { vim.loop.os_homedir().."/.cache/nvim/ls/elixir-ls/language_server.sh" };
}

-- HTML
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
 }

require'lspconfig'.tsserver.setup{}
