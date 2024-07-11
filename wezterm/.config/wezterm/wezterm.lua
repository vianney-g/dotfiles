-- Pull in the wezterm API
local wezterm = require "wezterm"

-- This table will hold the configuration
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha (Gogh)'
config.font = wezterm.font "JetBrainsMono Nerd Font"
config.window_background_opacity = 1
config.font_size = 12.0
config.enable_tab_bar = false
config.audible_bell = "Disabled"

config.window_padding = {
	left = 4,
	right = 4,
	top = 1,
	bottom = 0,
}

config.keys = {
	{
		key = "h",
		mods = "ALT",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = "f",
		mods = "ALT",
		action = wezterm.action.IncreaseFontSize,
	},
}
-- and finally, return the configuration to wezterm
return config
