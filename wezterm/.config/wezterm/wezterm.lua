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
-- config.color_scheme = 'AyuDark (Gogh)'
config.color_scheme = 'Atelier Savanna (base16)'
config.font = wezterm.font "JetBrainsMono NF"
config.window_background_opacity = 1
config.font_size = 13.0
config.line_height = 1.2
config.enable_tab_bar = false
config.audible_bell = "Disabled"
config.window_close_confirmation = "NeverPrompt"
config.warn_about_missing_glyphs = false

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

-- This is for nvim Zen mode support
wezterm.on('user-var-changed', function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while (number_value > 0) do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
		else
			overrides.font_size = number_value
		end
	end
	window:set_config_overrides(overrides)
end)

-- and finally, return the configuration to wezterm
return config
