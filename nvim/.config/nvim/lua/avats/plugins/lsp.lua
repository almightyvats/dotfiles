local shared = require("avats.lsp_shared")
local on_attach = shared.on_attach

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
        ensure_installed = { "clangd", "jdtls", "lua_ls"}  -- Ensure these LSPs are installed
      })

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
      --
      -- Check if the ESP-IDF environment variable is set
 --       local esp_idf_path = os.getenv("IDF_PATH")
 --       if esp_idf_path then
 --         -- for esp-idf
 --         lspconfig.clangd.setup{
 --           -- handlers = handlers,
 --           capabilities = capabilities,
 --           on_attach = on_attach,
 --           cmd = { "/home/vats/.espressif/tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/clang", "--background-index", "--query-driver=**", },
 --           root_dir = function()
 --               -- leave empty to stop nvim from cd'ing into ~/ due to global .clangd file
 --           end
 --         }
 --     else
 --         -- clangd config
 --      lspconfig.clangd.setup({
 --        capabilities = capabilities,
 --        on_attach = on_attach,
 --      })
 --     end

      local util = require("lspconfig/util")

      lspconfig.clangd.setup {
      cmd = { "clangd" },  -- default clangd
      capabilities = capabilities,
      on_attach = on_attach,

        on_new_config = function(new_config, new_root_dir)
          -- Better detection: ESP-IDF projects usually have sdkconfig
          local sdkconfig = util.path.join(new_root_dir, "sdkconfig")
          if vim.fn.filereadable(sdkconfig) == 1 then
            new_config.cmd = {
              "/home/vats/.espressif/tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/clangd",
              "--background-index",
              "--query-driver=**",
              "--compile-commands-dir=" .. new_root_dir
            }
          end
        end,
        root_dir = util.root_pattern("sdkconfig", "CMakeLists.txt", ".git"),
      }


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

