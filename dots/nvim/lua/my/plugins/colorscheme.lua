local tokyonight = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "night",
            styles = {
                comments = { italic = true },
                keywords = {},
                functions = { bold = true },
                variables = {},
                conditionals = { bold = true },
                sidebars = "transparent",
                floats = "transparent",
            },
            transparent = true,
        })
        vim.cmd([[colorscheme tokyonight]])
    end,
}

return tokyonight
