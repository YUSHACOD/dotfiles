return {
	"nendix/zen.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("zen").setup({
			variant = "dark", -- "dark" or "light"
			undercurl = true,
			transparent = false,
			dimInactive = false,
			terminalColors = true,
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = false },
			statementStyle = {},
			typeStyle = {},
			compile = false,
			colors = {
				palette = {}, -- override palette colors
				theme = {}, -- override theme colors
			},
			overrides = function(colors)
				return {}
			end,
		})

		-- vim.cmd.colorscheme("zen")
	end
}
