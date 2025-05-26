local tab_len = "2"
local cmds = {
    "setlocal shiftwidth=" .. tab_len,
    "setlocal softtabstop=" .. tab_len,
    "setlocal softtabstop=" .. tab_len,
}

for _, c in ipairs(cmds) do
    vim.cmd(c)
end
