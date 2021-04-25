local nnoremap = function(lhs,rhs)
  local mode = 'n'
  local opts = { noremap = true, silent = true }

  return vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

nnoremap('<Leader>,', [[<Cmd>lua require('telescope.builtin').git_files()<CR>]])
nnoremap('<Leader>b', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]])
nnoremap('<Leader>pf', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]])
nnoremap('<Leader>pg', [[<Cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]])
nnoremap('<Leader>fh', [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]])
