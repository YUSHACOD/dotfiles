vim.g.mapleader = " "                        -- space_bar is the mapping

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- to get the highlighted portion
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- up and down

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


vim.keymap.set({ "n", "v" }, "<leader>y", [["*y]])
vim.keymap.set("n", "<leader>Y", [["*Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>e", "<cmd>LspRestart<CR>")

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>n", "<cmd>noh<CR>")

vim.keymap.set("n", "<leader>ve", ":set virtualedit=all<cr>")
vim.keymap.set("n", "<leader>vo", ":set virtualedit=none<cr>")

-- windowing shit
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>s", "<cmd>vertical split<CR><C-w>l", opts)
vim.keymap.set("n", "<leader>is", "<cmd>horizontal split<CR><C-w>j", opts)


-- Remap window navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", opts)
vim.keymap.set("n", "<leader>j", "<C-w>j", opts)
vim.keymap.set("n", "<leader>k", "<C-w>k", opts)
vim.keymap.set("n", "<leader>l", "<C-w>l", opts)

-- Resize windows
vim.keymap.set("n", "<leader><left>",  "<C-w><", opts) -- shrink horizontally
vim.keymap.set("n", "<leader><right>", "<C-w>>", opts) -- grow horizontally
vim.keymap.set("n", "<leader><up>",    "<C-w>+", opts) -- grow vertically
vim.keymap.set("n", "<leader><down>",  "<C-w>-", opts) -- shrink vertically
vim.keymap.set("n", "<leader>=", "<C-w>=", opts)       -- equalize window sizes

-- Rotate / swap windows
vim.keymap.set("n", "<leader>r", "<C-w>r", opts) -- rotate windows
vim.keymap.set("n", "<leader>x", "<C-w>x", opts) -- swap windows
