local ok, err = pcall(require, "core")

vim.g.dracula_show_end_of_buffer = true  -- default false, Turn on or off EndOfBuffer symbol
vim.g.dracula_transparent_bg = true -- default false, enables transparent background

vim.cmd[[colorscheme minimalmistakes]]
vim.cmd("hi! link DashboardHeader Error")
vim.cmd("hi! link DashboardCenter Keyword")
vim.cmd("set colorcolumn=90")

if not ok then
   error("Error loading core" .. "\n\n" .. err)
end

vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

vim.g.header_email = "wayne6324@gmail.com"
vim.g.header_github = "The-Repo-Club"
vim.g.header_username = "The-Repo-Club"

vim.g.header_sh = "bash"
vim.g.header_auto_update = "true"
