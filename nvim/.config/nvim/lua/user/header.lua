local header = require("header")

header.setup({
	username = "The-Repo-Club",
	git = "https://github.com/The-Repo-Club",
	email = "wayne6324@gmail.com",
	-- You can also extend filetypes, e.g:
	ft = {
		c = {
			start_comment = "/*",
			end_comment = "*/",
			fill_comment = "*",
		},
		cpp = {
			start_comment = "/*",
			end_comment = "*/",
			fill_comment = "*",
		},
		make = {
			start_comment = "##",
			end_comment = "##",
			fill_comment = "#",
		},
		python = {
			start_comment = "##",
			end_comment = "##",
			fill_comment = "#",
		},
    sh = {
			start_comment = "##",
			end_comment = "##",
			fill_comment = "#",
		},
		lua = {
			start_comment = "--",
			end_comment = "--",
			fill_comment = "-",
		},
		vim = {
			start_comment = '""',
			end_comment = '""',
			fill_comment = "*",
		},
	},
})
