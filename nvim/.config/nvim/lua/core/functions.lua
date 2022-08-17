local M = {}

-- get_config_dir will get the config path based in the current system, e.g.
-- 'C:\Users\JohnDoe\AppData\Local' for windows and '~/.config' for *nix
-- @return string
local function get_config_dir()
	if string.find(vim.loop.os_uname().sysname, "Windows") then
		return os.getenv("USERPROFILE") .. "\\AppData\\Local\\"
	end

	return (os.getenv("XDG_CONFIG_HOME") and os.getenv("XDG_CONFIG_HOME")) or (os.getenv("HOME") .. "/.config")
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
-- in case that nvim_config_user_root directory does not exists.
M.nvim_root = string.format("%s%snvim", M.config_dir, M.sep)
-- The nvim configurations root directory
M.nvim_default_root = string.format("%s%snvim", M.config_dir, M.sep)
M.nvim_config_user_root = string.format("%s%slua%suser", M.nvim_default_root, M.sep, M.sep)
M.nvim_config_core_root = string.format("%s%slua%score", M.nvim_default_root, M.sep, M.sep)

M.edit_config = function()
	local selected_config = tonumber(vim.fn.inputlist({
		"Select a configuration file to edit:",
		"1. init.lua (default)",
		"2. alpha.lua",
		"3. autocommands.lua",
		"4. autopairs.lua",
		"5. bufferline.lua",
		"6. cmp.lua",
		"7. colorscheme.lua",
		"8. commands.lua",
		"9. comment.lua",
		"10. gitsigns.lua",
		"11. header.lua",
		"12. impatient.lua",
		"13. indentline.lua",
		"14. keymaps.lua",
		"15. lualine.lua",
		"16. nvim-tree.lua",
		"17. options.lua",
		"18. plugins.lua",
		"19. project.lua",
		"20. telescope.lua",
		"21. toggleterm.lua",
		"22. treesitter.lua",
		"23. trim.lua",
		"24. whichkey.lua",
		"99. functions.lua (core)",
	}))
	local open_command = "edit"

	if selected_config == 1 then
		vim.cmd(string.format("%s %s%sinit.lua", open_command, M.nvim_default_root, M.sep))
	elseif selected_config == 2 then
		vim.cmd(string.format("%s %s%salpha.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 3 then
		vim.cmd(string.format("%s %s%sautocommands.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 4 then
		vim.cmd(string.format("%s %s%sautopairs.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 5 then
		vim.cmd(string.format("%s %s%sbufferline.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 6 then
		vim.cmd(string.format("%s %s%scmp.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 7 then
		vim.cmd(string.format("%s %s%scolorscheme.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 8 then
		vim.cmd(string.format("%s %s%scommands.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 9 then
		vim.cmd(string.format("%s %s%scomment.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 10 then
		vim.cmd(string.format("%s %s%sgitsigns.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 11 then
		vim.cmd(string.format("%s %s%sheader.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 12 then
		vim.cmd(string.format("%s %s%simpatient.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 13 then
		vim.cmd(string.format("%s %s%sindentline.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 14 then
		vim.cmd(string.format("%s %s%skeymaps.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 15 then
		vim.cmd(string.format("%s %s%slualine.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 16 then
		vim.cmd(string.format("%s %s%snvim-tree.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 17 then
		vim.cmd(string.format("%s %s%soptions.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 18 then
		vim.cmd(string.format("%s %s%splugins.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 19 then
		vim.cmd(string.format("%s %s%sproject.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 20 then
		vim.cmd(string.format("%s %s%stelescope.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 21 then
		vim.cmd(string.format("%s %s%stoggleterm.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 22 then
		vim.cmd(string.format("%s %s%streesitter.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 23 then
		vim.cmd(string.format("%s %s%strim.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 24 then
		vim.cmd(string.format("%s %s%swhichkey.lua", open_command, M.nvim_config_user_root, M.sep))
	elseif selected_config == 99 then
		vim.cmd(string.format("%s %s%sfunctions.lua", open_command, M.nvim_config_core_root, M.sep))
	elseif selected_config ~= 0 then
		print(".\n\nInvalid option selected.")
	end
end

return M
