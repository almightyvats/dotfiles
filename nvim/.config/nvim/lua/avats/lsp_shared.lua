local M = {}

      -- Common on_attach function to set keybindings
M.on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true }
  local map = vim.api.nvim_buf_set_keymap

  -- Keybindings for LSP actions
  -- Go to definition (with Telescope)
  map(bufnr, 'n', 'gd', '<Cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)

  -- Find references
  map(bufnr, 'n', 'gu', '<Cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)

  -- Go to implementation
  map(bufnr, 'n', 'gi', '<Cmd>lua require("telescope.builtin").lsp_implementations()<CR>', opts)

  -- Go to type definition
  map(bufnr, 'n', '<leader>D', '<Cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', opts)

  -- Document symbols (all symbols in the current file)
  map(bufnr, 'n', '<leader>ds', '<Cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', opts)

  -- Workspace symbols (all symbols in the workspace/project)
  map(bufnr, 'n', '<leader>ws', '<Cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>', opts)

  -- Rename symbol
  map(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)

  -- Code action (can be run over an error or suggestion)
  map(bufnr, 'n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  -- Go to declaration
  map(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)

  -- Diagnostics navigation
  map(bufnr, 'n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  map(bufnr, 'n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  -- Show hover documentation
  map(bufnr, 'n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

  -- Show line diagnostics in a floating window
  map(bufnr, 'n', 'gl', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
end

return M
