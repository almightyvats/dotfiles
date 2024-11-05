return {
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>js", vim.cmd.Git)
    end,
  }
}
