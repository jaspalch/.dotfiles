return {
    "EdenEast/nightfox.nvim",
    -- Don't lazy load since this is the main colorscheme
    lazy = false,
    -- Make sure this loads before everything else
    priority = 1000,
    -- Load the colorscheme
    config = function()
        require("nightfox").setup({
            options = {
                styles = {
                    comments = "italic",
                    functions = "bold",
                    conditionals = "bold",
                },
            },
            palettes = {
                nightfox = {
                    -- Colors pulled from https://github.com/linkarzu/dotfiles-latest/blob/main/colorscheme/list/linkarzu-colors.sh
                    black = "#1c242f",
                    red = "#e9b3fd",
                    green = "#37f499",
                    yellow = "#19dfcf",
                    blue = "#1682ef",
                    magenta = "#987afb",
                    cyan = "#5fa9f4",
                    white = "#04d1f9",
                    orange = "#04d1f9",
                    pink = "#e9b3fd",

                    fg0 = "#04d1f9",
                    fg1 = "#1682ef",
                    fg2 = "#19dfcf",

                    bg0 = "#0a111a",
                    bg1 = "#0a111a",

                    comment = "#a5afc2",
                },
            },
        })
        vim.cmd([[colorscheme nightfox]])
    end,
}
