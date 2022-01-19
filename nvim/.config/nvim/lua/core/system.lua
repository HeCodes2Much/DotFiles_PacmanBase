--------------------------------------------------------------------------------
-- Path         - nvim/lua/core/system.lua
-- GitHub       - https://github.com/The-Repo-Club/
-- Author       - The-Repo-Club [wayne6324@gmail.com]
-- Start On     - Fri 05 Nov 00:16:08 GMT 2021
-- Modified On  - Fri 05 Nov 00:16:08 GMT 2021
--------------------------------------------------------------------------------

local M = {}

-- get_config_dir will get the config path based in the current system, e.g.
-- 'C:\Users\JohnDoe\AppData\Local' for windows and '~/.config' for *nix
-- @return string
local function get_config_dir()
    if string.find(vim.loop.os_uname().sysname, "Windows") then
        return os.getenv("USERPROFILE") .. "\\AppData\\Local\\"
    end

    return (os.getenv("XDG_CONFIG_HOME") and os.getenv("XDG_CONFIG_HOME"))
    or (os.getenv("HOME") .. "/.config")
end

-- get_separator will return the system paths separator, e.g. \ for Windows and / for *nix
-- @return string
local function get_separator()
    if vim.loop.os_uname().sysname == "Windows" then
        return "\\"
    end

    return "/"
end

M.config_dir = get_config_dir()

M.sep = get_separator()

-- The nvim root directory, works as a fallback for looking nvim configurations
-- in case that nvim_configs_root directory does not exists.
M.nvim_root = string.format("%s%snvim", M.config_dir, M.sep)
-- The nvim configurations root directory
M.nvim_default_root = string.format("%s%snvim%slua%splugins", M.config_dir, M.sep, M.sep, M.sep)
M.nvim_configs_root = string.format("%s%snvim%slua%scustom", M.config_dir, M.sep, M.sep, M.sep)

return M
