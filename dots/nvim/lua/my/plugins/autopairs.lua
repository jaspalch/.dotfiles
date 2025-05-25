return {
    "saghen/blink.pairs",
    version = "0.2.0", -- (recommended) only required with prebuilt binaries

    -- download prebuilt binaries from github releases
    dependencies = "saghen/blink.download",

    --- @module 'blink.pairs'
    --- @type blink.pairs.Config
    opts = {
        mappings = {
            -- you can call require("blink.pairs.mappings").enable() and require("blink.pairs.mappings").disable() to enable/disable mappings at runtime
            enabled = true,
            -- see the defaults: https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L10
            -- pairs = {},
        },
    },
}
