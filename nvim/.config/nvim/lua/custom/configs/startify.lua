local g = vim.g
local fn = vim.fn

g.webdevicons_enable_startify = 1
g.startify_enable_special = 0
g.startify_update_oldfiles = 1
g.startify_files_number = 30
g.startify_session_autoload = 1
g.startify_session_persistence = 1
g.startify_session_dir = '~/.config/nvim/session'
g.startify_session_delete_buffers = 1
g.startify_change_to_vcs_root = 1
g.startify_fortune_use_unicode = 1
g.startify_session_persistence = 1
g.startify_relative_path = 1
g.startify_change_to_dir = 1

g.startify_custom_header = {
    "                                                    ██                         ",
    "                                                    ░░                         ",
    "                 ███████   █████   ██████  ██    ██ ██ ██████████              ",
    "                ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██             ",
    "                 ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██             ",
    "                 ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██             ",
    "                 ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██             ",
    "                ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░              ",
    "                                                                               ",
    "                     [ Think NeoVim   Author:The-Repo-Club ]                   ",
}

g.startify_custom_footer = {
    "         +-----------------------------------------------+",
    "         |                Think NeoVim ^_^               |",
    "         |       Talk is cheap Show me the code          |",
    "         |                                               |",
    "         |            Github:The-Repo-Club               |",
    "         +-----------------------------------------------+",
}

local function lsCustomPluginSettingsDir()
    local settings_dir = "~/.config/nvim/lua/custom/configs/"
    local files = fn.systemlist("find -L ".. settings_dir .." -maxdepth 1 -type f | LC_ALL=C sort | rev | cut -d'/' -f-1 | rev")
    local lst = {}
    for key, file in pairs(files) do
        lst[key] = { line = file, path = (settings_dir..""..file) }
    end
  return lst
end

local function lsDefaultPluginSettingsDir()
    local settings_dir = "~/.config/nvim/lua/plugins/configs/"
    local files = fn.systemlist("find -L ".. settings_dir .." -maxdepth 1 -type f | LC_ALL=C sort | rev | cut -d'/' -f-1 | rev")
    local lst = {}
    for key, file in pairs(files) do
        lst[key] = { line = file, path = (settings_dir..""..file) }
    end
  return lst
end

local function lsCustomSettingsDir()
    local settings_dir = "~/.config/nvim/lua/custom/"
    local files = fn.systemlist("find -L ".. settings_dir .." -maxdepth 1 -type f | LC_ALL=C sort | rev | cut -d'/' -f-1 | rev")
    local lst = {}
    for key, file in pairs(files) do
        lst[key] = { line = file, path = (settings_dir..""..file) }
    end
  return lst
end

local function lsDefaultSettingsDir()
    local settings_dir = "~/.config/nvim/lua/plugins/"
    local files = fn.systemlist("find -L ".. settings_dir .." -maxdepth 1 -type f | LC_ALL=C sort | rev | cut -d'/' -f-1 | rev")
    local lst = {}
    for key, file in pairs(files) do
        lst[key] = { line = file, path = (settings_dir..""..file) }
    end
  return lst
end

local function lsGitDir()
    local files = fn.systemlist('getfolders -a /mnt/500GB/.gitlabs/')
    return fn.map(files, "{'line': v:val, 'path': v:val}")
end

local function lsAurDir()
    local files = fn.systemlist('getfolders -a /mnt/500GB/.aur/')
    return fn.map(files, "{'line': v:val, 'path': v:val}")
end

local function lsPwd()
    local files = fn.systemlist('find -L . -maxdepth 1 -type f -printf "%p\n" | LC_ALL=C sort')
    return fn.map(files, "{'line': v:val, 'path': v:val}")
end

g.startify_lists = {
    { type = 'sessions',                    header = {'     Recent Sessions'}},
    { type = 'bookmarks',                   header = {'     Bookmarked files'}},
    { type = lsPwd,                         header = {'     Current Directory: '}},
    { type = lsGitDir,                      header = {'     Git projects'}},
    { type = lsAurDir,                      header = {'     AUR projects'}},
    { type = lsCustomPluginSettingsDir,     header = {'     Custom Plugin Settings: '}},
    { type = lsDefaultPluginSettingsDir,    header = {'     Default Plugin Settings: '}},
    { type = lsCustomSettingsDir,           header = {'     Custom Settings: '}},
    { type = lsDefaultSettingsDir,          header = {'     Default Settings: '}},
    { type = 'files',                       header = {'     Recent files'}},
}

g.startify_bookmarks = {
    -- { D = '~/documents/' },
    -- { d = '~/downloads/' },
    -- { c = '~/.config/' },
}
