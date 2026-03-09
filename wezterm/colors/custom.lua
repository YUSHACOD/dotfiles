local naysayer_them = {
	-- JBLOW THEME
	background = "#282828",

	cursor_border = "#eeeeee",
	cursor_bg = "#eeeeee",

	selection_fg = '#1d1d1d',
	selection_bg = '#eeeef0',

	split = '#d3b58e',
}

local theme_file = "zenbones_dark.toml"

local wezterm = require('wezterm')
local home_path = os.getenv("XDG_CONFIG_HOME")
local loaded_theme, _ = wezterm.color.load_scheme(home_path .. "/wezterm/colors/" .. theme_file)


return loaded_theme
