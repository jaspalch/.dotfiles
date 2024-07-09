local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Font
config.font = wezterm.font 'Fira Code'
config.font_size = 11

-- Colorscheme
local custom_nightfox = wezterm.color.get_builtin_schemes()['nightfox']
custom_nightfox.background = '#0a111a'
config.colors = custom_nightfox

-- Keybindings

---- Set leader combo to CTRL-A
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    -- New tab
    { mods = 'LEADER', key = 'c', action = act.SpawnTab 'CurrentPaneDomain' },

    -- Cycle Tabs
    { mods = 'LEADER|CTRL', key = 'l', action = act.ActivateTabRelative(1) },
    { mods = 'LEADER|CTRL', key = 'h', action = act.ActivateTabRelative(-1) },

    -- Vertical split
    { mods = 'LEADER', key = '-', action = act.SplitPane { direction = 'Right' } },
    -- Horizontal split
    { mods = 'LEADER|SHIFT', key = '_', action = act.SplitPane { direction = 'Down' } },

    -- Move between panes
    { mods = 'LEADER', key = 'j', action = act.ActivatePaneDirection 'Down' },
    { mods = 'LEADER', key = 'k', action = act.ActivatePaneDirection 'Up' },
    { mods = 'LEADER', key = 'l', action = act.ActivatePaneDirection 'Right' },
    { mods = 'LEADER', key = 'h', action = act.ActivatePaneDirection 'Left' },

    -- Copy mode
    { mods = 'LEADER', key = 'v', action = act.ActivateCopyMode },

    -- Clear screen
    { mods = 'LEADER|SHIFT', key = 'l', action = act.SendKey { key = 'l', mods = 'CTRL' }},
}

return config
