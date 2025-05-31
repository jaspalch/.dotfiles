require("my.opts")
require("my.lazy_init")
if not vim.env.NVIM_MINIMAL then
    require("my.lspconfig")
    require("my.keybindings")
end
