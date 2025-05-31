return {
    "lewis6991/gitsigns.nvim",
    enabled = not vim.env.NVIM_MINIMAL,
    config = function()
        local gs = require("gitsigns")
        gs.setup()
    end,
}
