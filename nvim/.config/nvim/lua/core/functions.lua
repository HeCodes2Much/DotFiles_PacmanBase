local utils = require "core.utils"
local system = require "core.system"
local M = {}

M.edit_config = function()
  local selected_config = tonumber(vim.fn.inputlist({
    "Select a configuration file to edit:",
    "1. init.lua (default)",
    "2. init.lua",
    "3. nvimrc.lua",
  }))
  local config = utils.load_config()
  local setting = config.plugins.options

  local open_command = setting.open_command and "split" or "edit"

  if selected_config == 1 then
    vim.cmd(string.format("%s %s%sinit.lua", open_command, system.nvim_default_root, system.sep))
  elseif selected_config == 2 then
    vim.cmd(string.format("%s %s%sinit.lua", open_command, system.nvim_configs_root, system.sep))
  elseif selected_config == 3 then
    vim.cmd(string.format("%s %s%snvimrc.lua", open_command, system.nvim_configs_root, system.sep))
  elseif selected_config ~= 0 then
    log.error("Invalid option selected.")
  end
end

return M
