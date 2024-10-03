return {
  {
    -- Auto close parantheses, brackets, quotes, etc.
    "windwp/nvim-autopairs",
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    -- Highlights TODOS
    "folke/todo-comments.nvim",
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  }
}
