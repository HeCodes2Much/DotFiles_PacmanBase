local ok, err = pcall(require, "core")

vim.cmd("runtime mswin.vim")

vim.o.termguicolors = true

vim.g.dracula_show_end_of_buffer = true  -- default false, Turn on or off EndOfBuffer symbol
vim.g.dracula_transparent_bg = true -- default false, enables transparent background
vim.cmd[[colorscheme dracula]]
vim.cmd("hi! link DashboardHeader Error")

if not ok then
   error("Error loading core" .. "\n\n" .. err)
end
