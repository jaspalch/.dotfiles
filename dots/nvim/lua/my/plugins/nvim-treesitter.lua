return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            sync_install = false,
            highlight = {
                enable = true,
            },

            indent = {
                enable = true,
            },

            ensure_installed = {
                "go",
                "gomod",
                "gosum",
                "gotmpl",
                "gowork",
                "python",
                "bash",
                "dockerfile",
                "lua",
                "javascript",
                "html",
                "markdown",
                "make",
                "toml",
                "yaml",
                "nix",
            },
        })
    end,
}
