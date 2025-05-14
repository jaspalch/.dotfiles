return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        lualine.setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = { left = "|", right = "|" },
                section_separators = "",
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 500,
                },
            },
            sections = {
                lualine_a = {
                    { "mode", color = { gui = "bold" } },
                },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = {
                    { "filename", path = 1, color = { gui = "bold" } },
                },
                lualine_x = { "encoding", "fileformat", "filetype", { "lsp_status", icon = "󰑣" } },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {
                lualine_a = { "tabs" },
                lualine_b = { "buffers" },
            },
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        })
    end,
}
