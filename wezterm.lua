-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- help provide clearer error messages
config = wezterm.config_builder()

local is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

local is_darwin = function()
	return wezterm.target_triple:find("darwin") ~= nil
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'

-- default program
if os.execute("which fish") then
  config.default_prog = { 'fish' }
end

config.leader = {key = 'q', mods = 'CTRL' }
config.disable_default_key_bindings = true

cmd_key = is_darwin() and 'CMD' or 'CTRL'

config.keys = {
    { key = '+', mods = 'SHIFT|' .. cmd_key, action = wezterm.action.IncreaseFontSize },
    { key = '-', mods = cmd_key, action = wezterm.action.DecreaseFontSize },
    { key = '0', mods = cmd_key, action = wezterm.action.ResetFontSize },
    { key = 'v', mods = 'SHIFT|' .. cmd_key, action = wezterm.action.PasteFrom 'Clipboard' },
    { key = 'T', mods = 'SHIFT|' .. cmd_key, action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
    { key = 'W', mods = 'SHIFT|' .. cmd_key, action = wezterm.action.CloseCurrentTab {confirm = true} },
    { key = "Tab", mods = is_darwin() and 'ALT' or 'CTRL', action = wezterm.action.ActivateTabRelative(-1)},
    { key = "Tab", mods = is_darwin() and 'ALT' or 'CTRL', action = wezterm.action.ActivateTabRelative(1)},

    -- Panes
    { key = '+', mods = 'ALT|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = '_', mods = 'ALT|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'h', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
    { key = 'k', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'j', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
    { key = 'K', mods = 'ALT', action = wezterm.action.AdjustPaneSize {'Up', 5 } },
    { key = 'J', mods = 'ALT', action = wezterm.action.AdjustPaneSize {'Down', 5} },
    { key = 'H', mods = 'ALT', action = wezterm.action.AdjustPaneSize {'Left', 5 } },
    { key = 'L', mods = 'ALT', action = wezterm.action.AdjustPaneSize {'Right', 5} },
}

config.font_size = 12.0

-- config.term = 'wezterm'
-- and finally, return the configuration to wezterm
return config
