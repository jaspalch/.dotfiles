return {
    "ibhagwan/fzf-lua",
    enabled = not vim.env.NVIM_MINIMAL,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        winopts = {
            preview = {
                horizontal = "right:50%",
            },
        },
    },
}
