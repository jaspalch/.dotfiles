-- Keybindings
local wk = require("which-key")
local ts = require("telescope.builtin")
local ng = require("neogit")
local gs = require("gitsigns")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- LEADER bindings
wk.add({
    -- Buffer switcher
    { "<leader><space>", ts.buffers, desc = "Find buffer" },

    -- Tabs
    { "<leader><tab>", group = "Tabs" },

    -- lazy.nvim
    {
        "<leader>L",
        function()
            vim.cmd("Lazy")
        end,
        desc = "Open lazy.nvim",
    },

    -- Buffer management
    { "<leader>b", group = "Buffers" },
    {
        "<leader>bd",
        function()
            vim.cmd("bp | sp | bn | bd")
        end,
        desc = "Delete Buffer",
    },
    {
        "<leader>bh",
        function()
            vim.cmd("bp")
        end,
        desc = "Previous Buffer",
    },
    {
        "<leader>bl",
        function()
            vim.cmd("bn")
        end,
        desc = "Next Buffer",
    },

    -- Files
    { "<leader>f", group = "Files" },
    {
        "<leader>fX",
        function()
            os.remove(vim.fn.expand("%"))
        end,
        desc = "Delete file & buffer",
    },
    { "<leader>ff", ts.find_files, desc = "Find File" },
    {
        "<leader>fn",
        function()
            vim.cmd("enew")
        end,
        desc = "New File",
    },
    { "<leader>fp", ts.git_files, desc = "Find file in project" },
    { "<leader>fr", ts.oldfiles, desc = "Open Recent File" },

    -- Git
    { "<leader>g", group = "git" },
    {
        "<leader>gb",
        function()
            gs.blame_line({ full = true })
        end,
        desc = "blame",
    },
    { "<leader>gg", ng.open, desc = "neogit" },
    { "<leader>gs", ts.git_status, desc = "git status" },

    -- Random stuff
    { "<leader>r", group = "Random Stuff" },
    {
        "<leader>rs",
        function()
            vim.cmd("set list!")
        end,
        desc = "Toggle whitespace chars",
    },
    {
        "<leader>rl",
        function()
            vim.cmd("nohl")
        end,
        desc = "Remove search HL",
    },
    -- Search
    { "<leader>s", group = "Search" },
    { "<leader>ss", ts.live_grep, desc = "Live grep in $PWD" },

    {
        "<leader>t",
        function()
            vim.cmd("NvimTreeToggle")
        end,
        desc = "Toggle nvim-tree",
    },

    {
        "<leader>w",
        function()
            vim.cmd("w")
        end,
        desc = "[W]rite buffer",
    },
    {
        "<leader>W",
        function()
            vim.cmd("noautocmd w")
        end,
        desc = "[W]rite buffer (noautocmd)",
    },

    { "<leader>x", ts.commands, desc = "Commands" },
})

-- LSP bindings
wk.add({
    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    { "grn", vim.lsp.buf.rename, desc = "[R]e[n]ame" },

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    { "gra", vim.lsp.buf.code_action, desc = "[G]oto Code [A]ction", mode = { "n", "x" } },

    -- Find references for the word under your cursor.
    { "grr", ts.lsp_references, desc = "[G]oto [R]eferences" },

    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    { "gri", ts.lsp_implementations, desc = "[G]oto [I]mplementation" },

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    { "grd", ts.lsp_definitions, desc = "[G]oto [D]efinition" },

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    { "grD", vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration" },

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    { "gO", ts.lsp_document_symbols, desc = "Open Document Symbols" },

    -- Fuzzy find all the symbols in your current workspace.
    --  Similar to document symbols, except searches over your entire project.
    { "gW", ts.lsp_dynamic_workspace_symbols, desc = "Open Workspace Symbols" },

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    { "grt", ts.lsp_type_definitions, desc = "[G]oto [T]ype Definition" },
})
