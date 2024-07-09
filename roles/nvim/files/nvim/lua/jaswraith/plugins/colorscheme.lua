local palettes = {
    nightfox = {
        bg0 = "#0a111a",
        bg1 = "#0a111a",
    },
}

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
                },
            },
            palettes = palettes,
        })
        vim.cmd([[colorscheme nightfox]])
    end,
}
