local g = vim.g

g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = 'fzf'
g.dashboard_fzf_engine = "ag"
g.dashboard_session_directory = "~/.config/nvim/session"
g.dashboard_custom_header = {
    "                                                                              ",
    "=================     ===============     ===============   ========  ========",
    "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
    "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
    "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
    "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
    "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
    "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
    "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
    "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
    "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
    "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
    "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
    "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
    "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
    "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
    "||.=='    _-'                                                     `' |  /==.||",
    "=='    _-'                                                            \\/   `==",
    "\\   _-'                                                                `-_   /",
    " `''               [ Think NeoVim   Author:The-Repo-Club ]                ``'  ",
    "                                                                               ",
}

g.dashboard_custom_section = {
   a = { description = { "  Find File                      SPC d f f   " },    command = "DashboardFindFile" },
   b = { description = { "  History                        SPC d h     " },    command = "DashboardFindHistory" },
   c = { description = { "  Find Word                      SPC d f w   " },    command = "DashboardFindWord" },
   d = { description = { "洛 File New                       SPC d f n   " },    command = "DashboardNewFile" },
   -- e = { description = { "  Bookmarks                  SPC d b m   " },    command = "DashboardJumpMarks" },
   f = { description = { "  Load Last Session              SPC l       " },    command = "SessionLoad" },
   g = { description = { "  Save Session                   SPC s       " },    command = "SessionSave" },
   h = { description = { "  Open Private Configuration     SPC o c     " },    command = 'lua require("core.functions").edit_config()',
    },
}

local loaded = vim.fn.printf("%.3f",vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time)))

g.dashboard_custom_footer = {
    "                                                           ",
    "    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓    ",
    "    ┃    ╔═══════════════════════════════════════╗    ┃    ",
    "    ┃    ║           Think NeoVim ^_^            ║    ┃    ",
    "    ┃    ║                                       ║    ┃    ",
    "    ┃    ║    Talk is cheap Show us the code.    ║    ┃    ",
    "    ┃    ║                                       ║    ┃    ",
    "    ┃    ║         Github:The-Repo-Club          ║    ┃    ",
    "    ┃    ╚═══════════════════════════════════════╝    ┃    ",
    "    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛    ",
    "                                                           ",
    "               Nvim loaded in " .. loaded .. " seconds.    ",
}
