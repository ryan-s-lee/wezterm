-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'

config.leader = {key = 'q', mods = 'CTRL' }
config.disable_default_key_bindings = true
config.keys = {
    { key = '+', mods = 'SHIFT|CTRL', action = wezterm.action.IncreaseFontSize },
    { key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize },
    { key = '0', mods = 'CTRL', action = wezterm.action.ResetFontSize },
    { key = 'v', mods = 'SHIFT|CTRL', action = wezterm.action.PasteFrom 'Clipboard' },
    { key = 'T', mods = 'SHIFT|CTRL', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
    { key = 'W', mods = 'SHIFT|CTRL', action = wezterm.action.CloseCurrentTab {confirm = true} },
    { key = "PageUp", mods = 'SHIFT|CTRL', action = wezterm.action.ActivateTabRelative(-1)},
    { key = "PageDown", mods = 'SHIFT|CTRL', action = wezterm.action.ActivateTabRelative(1)},

    -- Panes
    { key = ';', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'L', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Right' },
    { key = 'H', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'LEADER', action = wezterm.action.AdjustPaneSize {'Right', 10 } },
    { key = 'h', mods = 'LEADER', action = wezterm.action.AdjustPaneSize {'Left', 10} },
}

config.font_size = 13.0

config.term = 'wezterm'
-- and finally, return the configuration to wezterm
return config
