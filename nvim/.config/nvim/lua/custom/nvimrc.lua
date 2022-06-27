local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

-- NOTE: To use this, make a copy with `cp example_nvimrc.lua nvimrc.lua`

--------------------------------------------------------------------

-- To use this file, copy the structure of `core/default_config.lua`,
-- examples of setting relative number & changing theme:

M.options = {
	mousdde = "a",
	encoding = "UTF-8",
	relativenumber = true,
	number = true,
	linebreak = true,
	showbreak = "+++",
	textwidth = 0,
	showmatch = true,
	visualbell = true,

	smartcase = true,
	gdefault = true,
	ignorecase = true,
	nohlsearch = true,
	nohlsearch = true,

	autoindent = true,
	cindent = true,
	noexpandtab = true,
	copyindent = true,
	preserveindent = true,
	expandtab = false,
	smartindent = false,
	smarttab = false,
	shiftwidth = 4,
	tabstop = 4,
	softtabstop = 4,
	-- Advance

	confirm = true,
	ruler = true,
	noshowmode = true,
	noruler = true,
	noshowcmd = true,
	cmdheight=1,
	nowrap = true,
	hidden = true,
	noswapfile = true,
	nobackup = true,
	undodir = "~/.config/nvim/undodir",
	undofile = true,
	scrolloff = 8,
	signcolumn = true,
	undolevels = 1000,
	backspace = {
		"indent",
		"eol",
		"start",
	},

	nocompatible = true,
	termguicolors = true,
	background = "dark",

}

M.plugins = {
	options = {
		open_command = false,
	}
}

return M
