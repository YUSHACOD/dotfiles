return {
	"sections",
	dir = "E:/sections.nvim",
	config = function()
		require("sections").setup({
			-- all options are optional; these are the defaults
			marker = "(section)",
			telescope_theme = "dropdown",
			width = 100,
			keymaps = {
				next = "]s",
				prev = "[s",
				["end"] = "<leader>es",
				create = "<leader>sc",
				jump = "<leader>sj",
				delete = "<leader>sd",
				telescope = "<leader>ss",
			},
			textobjects = true,
			commands = true,
			wrap_navigation = false,
		})
	end,
}
