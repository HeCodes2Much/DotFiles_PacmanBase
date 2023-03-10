local status_ok, trim = pcall(require, "trim")
if not status_ok then
	return
end

trim.setup({
	-- if you want to ignore markdown file.
	-- you can specify filetypes.
	ft_blocklist = { "markdown" },

	-- if you want to ignore space of top
	patterns = {
		[[%s/\s\+$//e]],
		[[%s/\($\n\s*\)\+\%$//]],
		[[%s/\(\n\n\)\n\+/\1/]],
	},
})
