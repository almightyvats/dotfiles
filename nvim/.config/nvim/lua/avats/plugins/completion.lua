return {
  {
    "hrsh7th/nvim-cmp",  -- Main autocompletion engine
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP source for completion
      "hrsh7th/cmp-buffer",    -- Buffer source
      "hrsh7th/cmp-path",      -- Path source
      "hrsh7th/cmp-cmdline",   -- Command-line completion
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = {
          ['<C-n>'] = cmp.mapping.select_next_item(),  -- Next completion item
          ['<C-p>'] = cmp.mapping.select_prev_item(),  -- Previous completion item
          ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        }
      })
      -- Set up completion for command line
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'path' },
          { name = 'cmdline' }
        }
      })
    end
  }
}
