local root_files = {
	'.luarc.json',
	'.luarc.jsonc',
	'.luacheckrc',
	'.stylua.toml',
	'stylua.toml',
	'selene.toml',
	'selene.yml',
	'.git',
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"j-hui/fidget.nvim",
	},

	config = function()
		local cmp = require('cmp')
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities())
		cmp_lsp.default_capabilities()

		require("fidget").setup({})
		require("mason").setup({
			---@since 1.0.0
			---@type '"prepend"' | '"append"' | '"skip"'
			PATH = "append",

			---@since 1.0.0
			log_level = vim.log.levels.INFO,

			---@since 1.0.0
			max_concurrent_installers = 4,

			---@since 1.0.0
			registries = {
				"github:mason-org/mason-registry",
			},

			---@since 1.0.0
			-- The provider implementations to use for resolving supplementary package metadata (e.g., all available versions).
			-- Accepts multiple entries, where later entries will be used as fallback should prior providers fail.
			-- Builtin providers are:
			--   - mason.providers.registry-api  - uses the https://api.mason-registry.dev API
			--   - mason.providers.client        - uses only client-side tooling to resolve metadata
			providers = {
				"mason.providers.registry-api",
				"mason.providers.client",
			},

			github = {
				---@since 1.0.0
				download_url_template = "https://github.com/%s/releases/download/%s/%s",
			},

			pip = {
				---@since 1.0.0
				upgrade_pip = false,

				---@since 1.0.0
				install_args = {},
			},

			ui = {
				---@since 1.0.0
				check_outdated_packages_on_open = true,

				---@since 1.0.0
				border = 'none',

				---@since 1.11.0
				backdrop = 50,

				---@since 1.0.0
				width = 0.8,

				---@since 1.0.0
				height = 0.9,

				icons = {
					---@since 1.0.0
					package_installed = "✔ ",

					---@since 1.0.0
					package_pending = "",

					---@since 1.0.0
					package_uninstalled = "○",
				},

				keymaps = {
					---@since 1.0.0
					toggle_package_expand = "<CR>",

					---@since 1.0.0
					install_package = "i",

					---@since 1.0.0
					update_package = "u",

					---@since 1.0.0
					check_package_version = "c",

					---@since 1.0.0
					update_all_packages = "U",

					---@since 1.0.0
					check_outdated_packages = "C",

					---@since 1.0.0
					uninstall_package = "X",

					---@since 1.0.0
					cancel_installation = "<C-c>",

					---@since 1.0.0
					apply_language_filter = "<C-f>",

					---@since 1.1.0
					toggle_package_install_log = "<CR>",

					---@since 1.8.0
					toggle_help = "g?",
				},
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup {
						capabilities = capabilities
					}
				end,

				clangd = function()
					local lspconfig = require("lspconfig")
					lspconfig.clangd.setup({
						root_dir = lspconfig.util.root_pattern(
							"compile_commands.json",
							"compile_flags.txt",
							".clangd",
							".git"
						),

						cmd = {
							"clangd",
							"--background-index",
							"--clang-tidy",
							"--query-driver=D:\\HeavyPrograms\\VS\\VC\\Tools\\MSVC\\14.44.35207\\bin\\HostX64\\x64\\cl.exe",
							-- Add or adjust flags here as needed:
							-- "--completion-style=detailed",
							-- "--header-insertion=iwyu",
						},

						init_options = {
							clangdFileStatus = true, -- Enables file status via LSP
							usePlaceholders = true, -- Enables placeholders on completion
							completeUnimported = true, -- Suggests completions for unimported headers/types
						},

						settings = {
							-- clangd currently doesn't take user-defined settings, but you can include them here if future versions do
							clangd = {
								arguments = { "--query-driver=D:\\HeavyPrograms\\VS\\VC\\Tools\\MSVC\\14.44.35207\\bin\\HostX64\\x64\\cl.exe" },
							},
						},
					})
				end,

				zls = function()
					local lspconfig = require("lspconfig")
					lspconfig.zls.setup({
						root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
						settings = {
							zls = {
								enable_inlay_hints = true,
								enable_snippets = true,
								warn_style = true,
							},
						},
					})
					vim.g.zig_fmt_parse_errors = 0
					vim.g.zig_fmt_autosave = 0
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup {
						capabilities = capabilities,
						settings = {
							Lua = {
								format = {
									enable = true,
									-- Put format options here
									-- NOTE: the value should be STRING!!
									defaultConfig = {
										indent_style = "space",
										indent_size = "2",
									}
								},
							}
						}
					}
				end,
			}
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<Enter>'] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
			}, {
				{ name = 'buffer' },
			})
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "none",
				source = true,
				header = "",
				prefix = "",
			},
			signs = true,
			underline = true,
		})
	end
}
