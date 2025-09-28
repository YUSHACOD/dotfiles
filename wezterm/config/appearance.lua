local wezterm = require('wezterm')
local colors = require('colors.custom')

return {
	notification_handling = "NeverShow",
	term = "wezterm",

	animation_fps = 60,
	max_fps = 60,

	front_end = 'WebGpu',

	-- font
	font = wezterm.font("JetBrainsMonoNL Nerd Font Mono"),
	cell_width = 1,
	font_size = 11.0,

	-- color scheme
	-- color_scheme = "Cloud (terminal.sexy)",
	colors = colors,

	-- cursor	
	default_cursor_style = "BlinkingBlock",
	cursor_blink_rate = 0,

	-- background
	window_background_opacity = 0.9,

	-- scrollbar
	enable_scroll_bar = false,

	-- tab bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	tab_max_width = 25,
	show_tab_index_in_tab_bar = false,
	switch_to_last_active_tab_when_closing_tab = false,

	-- window
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},

	window_close_confirmation = 'NeverPrompt',
	window_frame = {
		font = wezterm.font({ family = "JetBrainsMonoNL Nerd Font Mono", weight = "Regular" }),
		active_titlebar_bg = "#0c0b0f",
		-- active_titlebar_bg = "#181616",
	},

	window_decorations = "NONE | RESIZE",
	-- inactive_pane_hsb = {
	--    saturation = 0.9,
	--    brightness = 0.65,
	-- },
	--
	inactive_pane_hsb = {
		saturation = 1,
		brightness = 1,
	},
}
