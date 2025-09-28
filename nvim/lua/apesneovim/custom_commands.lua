vim.api.nvim_create_user_command(
	'LoadLeet',
	function()
		vim.cmd("Lazy load leetcode.nvim")
		vim.cmd("Leet")
		vim.cmd.colorscheme("catppuccin-frappe")
	end,
	{} -- Options table (empty if no options)
)
