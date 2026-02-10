local wezterm = require('wezterm')

local platform = require('utils.platform')
local act = wezterm.action

local mod = {}

if platform.is_win or platform.is_linux then
	mod.SUPER = 'CTRL'
end

local keys = {
	-- misc/useful --
	{ key = 'P',   mods = mod.SUPER,    action = act.ActivateCommandPalette },
	{ key = 'L',   mods = mod.SUPER,    action = act.ShowLauncher },

	{ key = 'F11', mods = 'NONE',       action = act.ToggleFullScreen },
	{ key = 'F12', mods = 'NONE',       action = act.ShowDebugOverlay },

	{ key = 'f',   mods = mod.SUPER,    action = act.Search({ CaseInSensitiveString = '' }) },

	-- copy/paste --
	{ key = 'c',   mods = 'CTRL|SHIFT', action = act.CopyTo('Clipboard') },
	{ key = 'v',   mods = 'CTRL|SHIFT', action = act.PasteFrom('Clipboard') },


	-- panes --
	-- panes: split panes
	{
		key = [[/]],
		mods = mod.SUPER,
		action = act.SplitVertical({ domain = 'CurrentPaneDomain' }),
	},
	{
		key = [[\]],
		mods = mod.SUPER,
		action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
	},

	-- panes: zoom+close pane
	{ key = 'Enter', mods = mod.SUPER, action = act.TogglePaneZoomState },
	{ key = 'w',     mods = mod.SUPER, action = act.CloseCurrentPane({ confirm = false }) },

	-- panes: navigation
	{ key = 'k',     mods = mod.SUPER, action = act.ActivatePaneDirection('Up') },
	{ key = 'j',     mods = mod.SUPER, action = act.ActivatePaneDirection('Down') },
	{ key = 'h',     mods = mod.SUPER, action = act.ActivatePaneDirection('Left') },
	{ key = 'l',     mods = mod.SUPER, action = act.ActivatePaneDirection('Right') },

	{
		key = "o",
		mods = mod.SUPER,
		-- toggling opacity
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.9
			else
				overrides.window_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},

	-- key-tables --
	-- resizes fonts
	{ key = '=', mods = mod.SUPER, action = act.IncreaseFontSize },
	{ key = '-', mods = mod.SUPER, action = act.DecreaseFontSize },
	{ key = ':', mods = mod.SUPER, action = act.ResetFontSize },

	-- resize panes
	{
		key = 'p',
		mods = 'LEADER',
		action = act.ActivateKeyTable({
			name = 'resize_pane',
			one_shot = false,
			timemout_miliseconds = 1000,
		}),
	},
}

-- stylua: ignore
local key_tables = {
	resize_pane = {
		{ key = 'k',      action = act.AdjustPaneSize({ 'Up', 1 }) },
		{ key = 'j',      action = act.AdjustPaneSize({ 'Down', 1 }) },
		{ key = 'h',      action = act.AdjustPaneSize({ 'Left', 1 }) },
		{ key = 'l',      action = act.AdjustPaneSize({ 'Right', 1 }) },
		{ key = 'Escape', action = 'PopKeyTable' },
		{ key = 'q',      action = 'PopKeyTable' },
	},
}

local mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'CTRL',
		action = act.OpenLinkAtMouseCursor,
	},
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = 'NONE',
		action = act.ScrollByLine(-3), -- Scroll up 3 lines per tick; decrease number for slower
		alt_screen = false,      -- Allows scrolling in vim like apps
	},
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = 'NONE',
		action = act.ScrollByLine(3), -- Scroll down 3 lines per tick
		alt_screen = false,
	},
}

return {
	disable_default_key_bindings = true,
	leader = { key = 'Space', mods = mod.SUPER },
	keys = keys,
	key_tables = key_tables,
	mouse_bindings = mouse_bindings,
}
