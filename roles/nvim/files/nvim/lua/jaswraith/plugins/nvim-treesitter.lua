return {
    "nvim-treesitter/nvim-treesitter",
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
                "python",
                "bash",
                "dockerfile",
                "lua",
                "javascript",
                "html",
                "markdown",
                "make",
                "toml",
            },
        })
    end
 }
