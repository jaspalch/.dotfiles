return {
    "stevearc/conform.nvim",
    enabled = not vim.env.NVIM_MINIMAL,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                json = { "prettier" },
                yaml = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                go = { "goimports" },
                shell = { "shfmt" },
                nix = { "alejandra" },
                cpp = { "clang-format" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
        })
    end,
}
