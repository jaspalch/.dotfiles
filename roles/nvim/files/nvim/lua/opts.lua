-- Set options

---- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

---- Case insensitive search (unless using capital letters)
vim.opt.ignorecase = true
vim.opt.smartcase = true

---- Raise dialogue for unsaved changes
vim.opt.confirm = true

---- Use visual bell instead of audio
vim.opt.visualbell = true

---- Set cmd window height
vim.opt.cmdheight = 2

---- Display line numbers
vim.opt.number = true

---- Tab/indent settings
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

---- Minimum # of lines from cursor to edge of buffer
vim.opt.so = 5

---- Don't redraw while doing macros
vim.opt.lazyredraw = true

---- Set magic for regexes
vim.opt.magic = true

---- Matching brackets highlight
vim.opt.showmatch = true
------ Highlight matching brackets for this amount of 1/10 secs
vim.opt.mat = 2

---- Set Unix EOL chars as default
vim.opt.fileformats = 'unix,dos,mac'

---- Disable backups
vim.opt.wb = false
vim.opt.swapfile = false

-- Enable 24 bit colors
vim.opt.termguicolors = true
