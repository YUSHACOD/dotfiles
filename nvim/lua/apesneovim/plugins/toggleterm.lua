return {
	'akinsho/toggleterm.nvim',
	version = "*",
	config = function()
		require("toggleterm").setup {
			-- open_mapping = "-t]", -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
			hide_numbers = true, -- hide the number column in toggleterm buffers
			size = 20,
			shade_filetypes = {},
			autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
			highlights = {
				-- highlights which map to a highlight group name and a table of it's values
				-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
				Normal = {
					guibg = "none",
				},
				NormalFloat = {
					link = 'Normal',
					guibg = 'none',
				},
				FloatBorder = {
					guifg = "none",
					guibg = "none",
				},
			},
			shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
			shading_factor = 1,
			shading_ration = 1,
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
			persist_size = true,
			persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
			direction = 'horizontal',
			close_on_exit = true, -- close the terminal window when the process exits
			clear_env = false, -- use only environmental variables from `env`, passed to jobstart()

			-- IMPORTANT ---------------------
			shell = "pwsh.exe -NoLogo",
			----------------------------------

			auto_scroll = true, -- automatically scroll to the bottom on terminal output
			-- This field is only relevant if direction is set to 'float'
			float_opts = {
				-- The border key is *almost* the same as 'nvim_open_win'
				-- see :h nvim_open_win for details on borders however
				-- the 'curved' border is a custom border type
				-- not natively supported but implemented in this plugin.
				border = 'curved',
				-- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
				winblend = 0,
				title_pos = 'center'
			},
			winbar = {
				enabled = false,
			},
			responsiveness = {
				-- breakpoint in terms of `vim.o.columns` at which terminals will start to stack on top of each other
				-- instead of next to each other
				-- default = 0 which means the feature is turned off
				horizontal_breakpoint = 200,
			}
		}
	end,
}
