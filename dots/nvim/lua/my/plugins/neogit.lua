return {
    "NeogitOrg/neogit",
    enabled = not vim.env.NVIM_MINIMAL,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },
    config = true,
}
