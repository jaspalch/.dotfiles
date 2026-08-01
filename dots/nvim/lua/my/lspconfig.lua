-- Default LSP server settings
local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("*", {
    root_markers = { ".git" },
    capabilities = capabilities,
})

vim.lsp.enable({
    "bashls",
    "gopls",
    "lua_ls",
    "pyright",
    "nil_ls",
    "clangd",
})

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
    },
})

-- Inline LSP diagnostics
vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },

    float = {
        max_width = 80,
        wrap = true,
        border = "rounded",
    },
})
