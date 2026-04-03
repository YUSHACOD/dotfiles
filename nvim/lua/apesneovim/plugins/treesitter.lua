return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	branch = 'main',
	build = ':TSUpdate',
	config = function()
		local ts = require("nvim-treesitter")

		-- Replaces `ensure_installed`: install your baseline parsers at startup.
		-- This is a no-op for already-installed parsers, so it's safe to always run.
		ts.install({ "c", "lua", "vim", "vimdoc", "cpp" }, { summary = false })

		-- Replaces `auto_install` + `highlight.enable` + `indent.enable`:
		-- On every FileType event, install the parser if missing, then activate features.
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("treesitter_autostart", { clear = true }),
			pattern = "*",
			callback = function(ev)
				local lang = ev.match

				-- Only attempt install if the language is known to nvim-treesitter,
				-- avoiding warnings for filetypes like 'help', 'qf', 'man', etc.
				local parsers = require("nvim-treesitter.parsers")
				if parsers[lang] then
					local ok, task = pcall(ts.install, { lang }, { summary = false })
					if ok and task then
						task:wait(10000)
					end
				end

				-- Enable treesitter highlighting (replaces highlight.enable = true)
				pcall(vim.treesitter.start, ev.buf, lang)

				-- Enable treesitter indentation (replaces indent.enable = true)
				-- vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

				-- Enable treesitter folding (optional)
				-- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				-- vim.wo[0][0].foldmethod = "expr"
				-- vim.wo.foldenable = false  -- start with folds open; use 'zi' or 'zR' to open all
			end,
		})
	end,
}
