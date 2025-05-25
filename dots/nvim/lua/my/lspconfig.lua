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
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
            -- vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

-- Prevent autocompletion from selecting first candidate automatically
vim.cmd("set completeopt+=noselect")

-- Inline LSP diagnostics
vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
})
