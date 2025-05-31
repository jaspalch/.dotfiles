return {
    "folke/which-key.nvim",
    enabled = not vim.env.NVIM_MINIMAL,
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        require("which-key").setup({
            replace = {
                ["<space>"] = "SPC",
                ["<cr>"] = "RET",
                ["<tab>"] = "TAB",
            },
        })
    end,
}
