return {
    {
        "nvim-treesitter/nvim-treesitter",  -- Syntax highlighting
        build = ":TSUpdate",  -- Automatically update parsers
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {  -- Specify the languages you need
                    -- "go",       -- Go language support
                    "lua",      -- Lua language support
                    "java",     -- Java language support
                -- "cpp",      -- C++ language support
                    "sql",
                },
                highlight = {
                    enable = true,  -- Enable syntax highlighting
                },
            })
        end,
    }
}

