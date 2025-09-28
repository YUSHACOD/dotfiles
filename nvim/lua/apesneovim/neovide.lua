if vim.g.neovide then
	-- changing the font size
	vim.g.neovide_scale_factor = 1.0
	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta
	end
	vim.keymap.set("n", "<C-=>", function()
		change_scale_factor(0.05)
	end)
	vim.keymap.set("n", "<C-->", function()
		change_scale_factor(-0.05)
	end)


	-- font color rendering
	vim.g.neovide_text_gamma = 0.0
	vim.g.neovide_text_contrast = 1.0

	-- font padding
	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0

	-- float blur
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0

	-- float shadow
	vim.g.neovide_floating_shadow = false
	vim.g.neovide_floating_z_height = 10
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 5

	-- float radius
	vim.g.neovide_floating_corner_radius = 10.0

	-- window animation length
	vim.g.neovide_position_animation_length = 0.175

	-- scroll animation length
	vim.g.neovide_scroll_animation_length = 0.1

	-- far scroll lines
	vim.g.neovide_scroll_animation_far_lines = 5

	-- hide mouse when typing
	vim.g.neovide_hide_mouse_when_typing = true

	-- underline scaling
	vim.g.neovide_underline_stroke_scale = 0.5

	-- refresh rate
	vim.g.neovide_refresh_rate = 60
	-- idle refresh rate
	vim.g.neovide_refresh_rate_idle = 30

	-- confirm quit
	vim.g.neovide_confirm_quit = true

	-- profiler
	vim.g.neovide_profiler = false
	vim.api.nvim_create_user_command(
		'Profiler',
		function()
			vim.g.neovide_profiler = not vim.g.neovide_profiler
		end,
		{} -- Options table (empty if no options)
	)

	-- cursor animation length
	vim.g.neovide_cursor_animation_length = 0.08

	-- short animation length
	vim.g.neovide_cursor_short_animation_length = 0.0


	-- cursor trail size
	vim.g.neovide_cursor_trail_size = 0.8

	-- cursor antialiasing
	vim.g.neovide_cursor_antialiasing = true

	-- cursor animation in insert mode
	vim.g.neovide_cursor_animate_in_insert_mode = false

	-- animate switch to command line
	vim.g.neovide_cursor_animate_command_line = true

	-- unfocused outline width
	vim.g.neovide_cursor_unfocused_outline_width = 0.05


	vim.keymap.set('v', '<C-S-c>', '"+y')      -- Copy
	vim.keymap.set('n', '<C-S-v>', '"+P')      -- Paste normal mode
	vim.keymap.set('v', '<C-S-v>', '"+P')      -- Paste visual mode
	vim.keymap.set('c', '<C-S-v>', '<C-R>+')   -- Paste command mode
	vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode

	-- Allow clipboard copy paste in neovim
	vim.api.nvim_set_keymap('', '<C-S-v>', '+p<CR>', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('!', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('t', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('v', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
end
