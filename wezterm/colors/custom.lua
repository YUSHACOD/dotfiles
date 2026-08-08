local naysayer_theme = {
	-- JBLOW THEME
	background = "#282828",

	cursor_border = "#eeeeee",
	cursor_bg = "#eeeeee",

	selection_fg = '#1d1d1d',
	selection_bg = '#eeeef0',

	split = '#d3b58e',
}


local saga = {
	foreground = "#fff6ff",
	background = "#05080a",
	cursor_bg = "#fff6ff",
	cursor_fg = "#fff6ff",
	cursor_border = "#0f1214",
	selection_fg = "#05080a",
	selection_bg = "#fff6ff",
	scrollbar_thumb = "#fff6ff",
	split = "#090909",
	ansi = { "#0f1214", "#ff9fbc", "#baf7b5", "#ffc79b", "#b2fff3", "#dfbaff", "#ffaecb", "#ffecff" },
	brights = { "#141719", "#ffa4c1", "#bffcba", "#ffcca0", "#adfaee", "#f3ceff", "#ffc2df", "#fff6ff" },
	indexed = { [136] = "#fff6ff" },
	tab_bar = {
		active_tab = {
			bg_color = "#05080a",
			fg_color = "#fff6ff",
			italic = true,
		},
		inactive_tab = { bg_color = "#090909", fg_color = "#05080a" },
		inactive_tab_hover = { bg_color = "#0A0D0F", fg_color = "#090909" },
		new_tab = { bg_color = "#0A0D0F", fg_color = "#090909" },
		new_tab_hover = { bg_color = "#ffc2df", fg_color = "#090909" },
	},
}

local theme_file = "oxocarbon-dark.toml"

local wezterm = require('wezterm')
local home_path = os.getenv("XDG_CONFIG_HOME")
local loaded_theme, _ = wezterm.color.load_scheme(home_path .. "/wezterm/colors/" .. theme_file)


return loaded_theme
