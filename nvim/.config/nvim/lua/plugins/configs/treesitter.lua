local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

ts_config.setup {
    ensure_installed = {
        "lua",
        "org",
		"haskell",
		"cpp",
		"c",
		"javascript",
		"markdown"
    },
    highlight = {
        enable = true,
        use_languagetree = true,
		additional_vim_regex_highlighting = {'org'},
    },
}
