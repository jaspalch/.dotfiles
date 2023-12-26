return {
    'folke/tokyonight.nvim',
    -- Don't lazy load since this is the main colorscheme
    lazy = false,
    -- Make sure this loads before everything else
    priority = 1000,
    -- Load the colorscheme
    config = function()
        vim.cmd([[colorscheme tokyonight-moon]])
    end,
}

