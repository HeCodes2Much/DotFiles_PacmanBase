local alpha = require("alpha")
-- General Settings auto commands
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("_general_settings_filetype", { clear = true }),
	pattern = { "qf", "help", "man", "lspinfo", "lazygit" },
	command = "nnoremap <silent> <buffer> q :close<CR>",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("_general_settings_yank_text", { clear = true }),
	pattern = "*",
	callback = function()
		require("vim.highlight").on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("_general_settings_buffer_enter", { clear = true }),
	pattern = "*",
	command = "set formatoptions-=cro",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("_general_settings_filetype", { clear = true }),
	pattern = "qf",
	command = "set nobuflisted",
})

-- Git auto commands
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("_git", { clear = true }),
	pattern = "gitcommit",
	command = "setlocal wrap | setlocal spell",
})

-- Markdown auto commands
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("_markdown", { clear = true }),
	pattern = "markdown",
	command = "setlocal wrap | setlocal spell",
})

-- Auto resize auto commands
vim.api.nvim_create_autocmd("VimResized", {
	group = vim.api.nvim_create_augroup("_auto_resize", { clear = true }),
	pattern = "*",
	command = "tabdo wincmd =",
})

-- Alpha dashboard auto commands
vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("_alpha_user", { clear = true }),
	pattern = "AlphaReady",
	command = "set laststatus=0 | set showtabline=0 | set mouse=",
})

vim.api.nvim_create_autocmd("BufUnload", {
	group = vim.api.nvim_create_augroup("_alpha_buffer", { clear = true }),
	pattern = "*",
	command = "set laststatus=2 | set showtabline=2 | set mouse=a",
})

vim.api.nvim_create_autocmd("TabNewEntered", {
	group = vim.api.nvim_create_augroup("_alpha_newtab", { clear = true }),
	pattern = "*",
	callback = function()
		alpha.start()
	end,
})

-- LSP auto commands
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("_lsp", { clear = true }),
	pattern = "*.lua",
	callback = function()
		require("stylua").format()
	end,
})
