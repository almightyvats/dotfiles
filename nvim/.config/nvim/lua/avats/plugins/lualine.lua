return {
    "nvim-lualine/lualine.nvim",  -- Statusline pluginAdd commentMore actions
    dependencies = { "nvim-tree/nvim-web-devicons" },  -- Optional: for icons
    config = function()
        require("lualine").setup({
            options = {
                theme = "ayu",  -- Set theme
                section_separators = '',
                component_separators = '',
            },
        })
    end,
}
