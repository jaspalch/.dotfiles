return {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require('telescope').setup({
            pickers = {
                buffers = {
                    sort_lastused = true,
                },
            } 
        })
    end
}
