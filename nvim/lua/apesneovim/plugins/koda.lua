return {
	"oskarnurm/koda.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("koda").setup({
			transparent = false, -- enable for transparent backgrounds

			-- Automatically enable highlights only for plugins installed by your plugin manager
			-- Currently supports `lazy.nvim`, `mini.deps` and `vim.pack`
			-- Disable this to load ALL available plugin highlights
			auto = true,

			cache = true, -- cache for better performance

			-- Style to be applied to different syntax groups
			-- Common use case would be to set either `italic = true` or `bold = true` for a desired group
			-- See `:help nvim_set_hl` for more valid values
			styles = {
				functions = { bold = true },
				keywords  = {},
				comments  = { italic = true },
				strings   = {},
				constants = {}, -- includes numbers, booleans
			},

			-- Override colors
			-- These will be merged into the active palette (Dark or Light)
			-- Example default palette for dark background:
			colors = {
				bg        = "#101010",
				fg        = "#b0b0b0",
				dim       = "#000000",
				line      = "#272727",
				keyword   = "#777777",
				comment   = "#50585d",
				border    = "#ffffff",
				emphasis  = "#ffffff",
				func      = "#ffffff",
				string    = "#ffffff",
				char      = "#ffffff",
				const     = "#d9ba73",
				highlight = "#458ee6",
				info      = "#8ebeec",
				success   = "#86cd82",
				warning   = "#d9ba73",
				danger    = "#ff7676",
				green     = "#14ba19",
				orange    = "#f54d27",
				red       = "#701516",
				pink      = "#f2a4db",
				cyan      = "#5abfb5",
			},

			-- You can modify or extend highlight groups using the `on_highlights` configuration option
			-- Any changes made take effect when highlights are applied
			on_highlights = function(hl, c) end,

		})
	end,
}
