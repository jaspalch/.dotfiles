local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- Font
config.font = wezterm.font("JetBrains Mono NL Medium")
config.font_size = 12

-- Colorscheme
config.color_scheme = "carbonfox"

-- Window decorations
config.window_decorations = "NONE"

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- Keybindings
---- Set leader combo to CTRL-T
config.leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- New tab
	{ mods = "LEADER", key = "c", action = act.SpawnTab("CurrentPaneDomain") },

	-- Cycle Tabs
	{ mods = "LEADER|CTRL", key = "l", action = act.ActivateTabRelative(1) },
	{ mods = "LEADER|CTRL", key = "h", action = act.ActivateTabRelative(-1) },

	-- Vertical split
	{ mods = "LEADER", key = "-", action = act.SplitPane({ direction = "Right" }) },
	-- Horizontal split
	{ mods = "LEADER|SHIFT", key = "_", action = act.SplitPane({ direction = "Down" }) },

	-- Move between panes
	{ mods = "LEADER", key = "j", action = act.ActivatePaneDirection("Down") },
	{ mods = "LEADER", key = "k", action = act.ActivatePaneDirection("Up") },
	{ mods = "LEADER", key = "l", action = act.ActivatePaneDirection("Right") },
	{ mods = "LEADER", key = "h", action = act.ActivatePaneDirection("Left") },

	-- Copy mode
	{ mods = "LEADER", key = "v", action = act.ActivateCopyMode },

	-- Clear screen
	{ mods = "LEADER|SHIFT", key = "l", action = act.SendKey({ key = "l", mods = "CTRL" }) },

	-- Send CTRL-a
	-- { mods = "LEADER|CTRL", key = "a", action = act.SendKey({ key = "a", mods = "CTRL" }) },
}

return config
