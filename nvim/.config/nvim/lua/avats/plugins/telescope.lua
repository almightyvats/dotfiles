return {
    {
        "nvim-telescope/telescope.nvim",  -- Fuzzy Finder
        dependencies = { "nvim-lua/plenary.nvim" },  -- Required dependency
        config = function()
            require("telescope").setup()
            -- File search with <leader>f
            vim.keymap.set('n', '<leader>f', ":Telescope find_files<CR>", { silent = true, desc = "Find Files" })
            -- Search text with <leader>g
            vim.keymap.set('n', '<leader>g', ":Telescope live_grep<CR>", { silent = true, desc = "Search Text" })
        end,
    }
}
