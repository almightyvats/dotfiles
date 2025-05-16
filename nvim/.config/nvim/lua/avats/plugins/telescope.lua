return {
    {
        "nvim-telescope/telescope.nvim",  -- Fuzzy Finder
        dependencies = { "nvim-lua/plenary.nvim" },  -- Required dependency
        config = function()
            -- require("telescope").setup()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",       -- include hidden files
                        "--no-ignore",    -- include .gitignore'd files
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true,          -- show hidden files
                        no_ignore = true,       -- don't respect .gitignore
                        follow = true,          -- follow symlinks
                    },
                },
            })
            -- File search with <leader>f
            vim.keymap.set('n', '<leader>f', ":Telescope find_files<CR>", { silent = true, desc = "Find Files" })
            -- Search text with <leader>g
            vim.keymap.set('n', '<leader>g', ":Telescope live_grep<CR>", { silent = true, desc = "Search Text" })
        end,
    }
}
