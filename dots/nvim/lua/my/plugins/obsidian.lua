return {
    "epwalsh/obsidian.nvim",
    enabled = not vim.env.NVIM_MINIMAL,
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/Dropbox/obsidian/personal",
            },
            {
                name = "work",
                path = "~/Dropbox/obsidian/work",
            },
        },
    },
}
