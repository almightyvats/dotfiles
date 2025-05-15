return {
  {
    "neovim/nvim-lspconfig",  -- Core LSP configuration
    dependencies = {
      { "williamboman/mason.nvim", config = true },  -- Mason for managing LSP servers
      "williamboman/mason-lspconfig.nvim",  -- Mason integration with lspconfig
      "hrsh7th/cmp-nvim-lsp",  -- Integrates LSP with nvim-cmp for autocompletion
    },
    config = function()
      -- Setup Mason and ensure LSP servers are installed
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "clangd", "jdtls", "lua_ls" }  -- Ensure these LSPs are installed
      })

      -- Common on_attach function to set keybindings
      local on_attach = function(_, bufnr)
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

      -- LSP server configurations
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- Enable capabilities for autocompletion (nvim-cmp integration)
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- Global diagnostic configuration
      vim.diagnostic.config({
        virtual_text = true,  -- Show virtual text (inline diagnostics)
        signs = true,         -- Show signs in the gutter
        update_in_insert = false,  -- Don't update diagnostics in insert mode
        underline = true,     -- Underline the diagnostics
        severity_sort = true, -- Sort diagnostics by severity
      })

      -- Language servers setup
      -- lspconfig.gopls.setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })

      -- lspconfig.clangd.setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },  -- Avoid global 'vim' warnings
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),  -- Include Neovim runtime files
            },
          },
        },
      })

      -- lspconfig.jdtls.setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- })

      lspconfig.sqlls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.dockerls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  }
}

