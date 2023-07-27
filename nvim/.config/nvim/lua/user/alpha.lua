local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	"                                                  ",
	"  ooooo       ooooo  oooo oooo   oooo      o      ",
	"   888         888    88   8888o  88      888     ",
	"   888         888    88   88 888o88     8  88    ",
	"   888      o  888    88   88   8888    8oooo88   ",
	"  o888ooooo88   888oo88   o88o    88  o88o  o888o ",
	"                                                  ",
	"                                                  ",
	"     [ Think LunaVim   Author:The-Repo-Club ]     ",
}
dashboard.section.buttons.val = {
	dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "󰄉  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "󰊄  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":EditConfiguration <CR>"),
	dashboard.button("q", "󰅚  Quit LunaVim", ":qa <CR>"),
}

dashboard.section.footer.val = {
	"                                                           ",
	"    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓    ",
	"    ┃    ╔═══════════════════════════════════════╗    ┃    ",
	"    ┃    ║           Think LunaVim ^_^           ║    ┃    ",
	"    ┃    ║                                       ║    ┃    ",
	"    ┃    ║    Talk is cheap Show us the code.    ║    ┃    ",
	"    ┃    ║                                       ║    ┃    ",
	"    ┃    ║         Github:The-Repo-Club          ║    ┃    ",
	"    ┃    ╚═══════════════════════════════════════╝    ┃    ",
	"    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛    ",
	"                                                           ",
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
