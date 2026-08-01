return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        -- Set transparency on everything except lualine_a (mode)
        local auto_theme_custom = require("lualine.themes.auto")
        auto_theme_custom.normal.c.bg = nil
        auto_theme_custom.normal.b.bg = nil
        local base_statusline_highlights =
            { "StatusLine", "StatusLineNC", "Tabline", "TabLineFill", "TabLineSel", "Winbar", "WinbarNC" }
        for _, hl_group in pairs(base_statusline_highlights) do
            vim.api.nvim_set_hl(0, hl_group, { bg = "none" })
        end
        lualine.setup({
            options = {
                icons_enabled = true,
                theme = auto_theme_custom,
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
