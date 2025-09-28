return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	config = function()
		local telescope = require("telescope")
		local themes = require("telescope.themes")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "truncate" },
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = { width = 0.85, preview_width = 0.55 },
					vertical = { height = 0.9, preview_height = 0.6 },
					center = { width = 0.6 },
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--no-ignore-vcs",
					"--glob",
					"!.git/*",
				},
				find_command = { "rg", "--files", "--hidden", "--no-ignore-vcs", "--glob", "!.git/*" },
				mappings = {
					i = {
						["<esc>"] = require("telescope.actions").close,
					},
					n = {},
				},
				set_env = { ["COLORTERM"] = "truecolor" },
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--no-ignore-vcs", "--glob", "!.git/*" },
					preview = true,
				},
				live_grep = {},
				buffers = { sort_lastused = true, previewer = false },
				help_tags = {},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		local _, _ = pcall(telescope.load_extension, "fzf")

		local theme_presets = {
			ivy = function(opts) return themes.get_ivy(opts or {}) end,
			dropdown = function(opts) return themes.get_dropdown(opts or {}) end,
			cursor = function(opts) return themes.get_cursor(opts or {}) end,
			center = function(opts) return themes.get_center(opts or {}) end,
		}

		local map = {
			["ff"] = function() builtin.find_files(theme_presets.ivy()) end,
			["fs"] = function() builtin.live_grep(theme_presets.ivy()) end,
			["<leader>fb"] = function() builtin.buffers(theme_presets.dropdown()) end,
			["<leader>fh"] = function() builtin.help_tags(theme_presets.dropdown()) end,
			["<leader>fr"] = function() builtin.resume(theme_presets.dropdown()) end,
			["<leader>fgf"] = function() builtin.git_files(theme_presets.ivy()) end,
			["<leader>fs"] = function() builtin.lsp_document_symbols(theme_presets.cursor()) end,
		}

		for lhs, rhs in pairs(map) do
			vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true })
		end
	end,
}
