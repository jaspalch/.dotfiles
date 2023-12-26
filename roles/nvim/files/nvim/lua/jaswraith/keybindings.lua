-- Keybindings
local wk = require('which-key')
local ts = require('telescope.builtin')
local ng = require('neogit')

wk.register({
  ["<leader>f"] = {
    name = "Files",
    f = { ts.find_files, "Find File" },
    p = { ts.git_files, "Find file in project" },
    r = { ts.oldfiles, "Open Recent File" },
    n = { function() vim.cmd('enew') end, "New File" },
    X = { function() os.remove(vim.fn.expand('%')); vim.cmd('bdelete') end, "Delete file & buffer" }
  },

  ["<leader>b"] = {
    name = "Buffers",
    d = { function() vim.cmd('bd') end, "Delete Buffer" },
    l = { function() vim.cmd('bn') end, "Next Buffer" },
    h = { function() vim.cmd('bp') end, "Previous Buffer" },
  },

  ["<leader>s"] = {
    name = "Search",
    s = { ts.live_grep, "Live grep in $PWD" },
  },

  ["<leader>g"] = {
    name = "git",
    s = { ts.git_status, "git status" },
    g = { ng.open, "neogit" },
  },

  ["<leader>r"] = {
    name = "Random Stuff",
    s = { function() vim.cmd('set list!') end, "Toggle whitespace chars" },
  },

  -- Top level bindings
  ["<leader>w"] = { function() vim.cmd('w') end, "Write buffer" },
  ["<leader><space>"] = { ts.buffers, "Find buffer" },
  ["<leader>x"] = { ts.command_history, "Commands" },
  ["<leader>t"] = { function() vim.cmd('NvimTreeToggle') end, "Toggle nvim-tree" },
  ["<leader>l"] = { function() vim.cmd('Lazy') end, "Open lazy.nvim" },
})
