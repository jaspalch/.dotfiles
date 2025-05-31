return {
    "NeogitOrg/neogit",
    enabled = not vim.env.NVIM_MINIMAL,
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
        "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
}
