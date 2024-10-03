return {
    {
        "nvim-lualine/lualine.nvim",  -- Statusline plugin
        dependencies = { "nvim-tree/nvim-web-devicons" },  -- Optional: for icons
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin",  -- Set theme
                    section_separators = '',
                    component_separators = '',
                },
            })
        end,
    }
}
