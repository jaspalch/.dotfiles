return {
    "obsidian-nvim/obsidian.nvim",
    enabled = not vim.env.NVIM_MINIMAL,
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",
    lazy = true,
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
