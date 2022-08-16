local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("packer_user_config", { clear = true }),
	pattern = "plugins.lua",
	callback = function()
		vim.cmd("source <afile>")
		require("packer").sync()
	end,
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use({
		"wbthomason/packer.nvim",
		commit = "90b323bccc04ad9b23c971a85813a1405c7725a8",
	}) -- Have packer manage itself
	use({
		"nvim-lua/plenary.nvim",
		commit = "31807eef4ed574854b8a53ae40ea3292033a78ea",
	}) -- Useful lua functions used by lots of plugins
	use({
		"windwp/nvim-autopairs",
		commit = "34bd374f75fb58656572f847e2bc3565b0acb34f",
	}) -- Autopairs, integrates with both cmp and treesitter
	use({
		"numToStr/Comment.nvim",
		commit = "0932d0cdcee31d12664f20f728cde8915614a623",
	})
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		commit = "4befb8936f5cbec3b726300ab29edacb891e1a7b",
	})
	use({
		"kyazdani42/nvim-web-devicons",
		commit = "2d02a56189e2bde11edd4712fea16f08a6656944",
	})
	use({
		"kyazdani42/nvim-tree.lua",
		commit = "09a51266bca28dd87febd63c66bdbd74f7764a63",
	})
	use({
		"akinsho/bufferline.nvim",
		commit = "f5791fdd561c564491563cd4139727c38d135dbf",
	})
	use({
		"moll/vim-bbye",
		commit = "25ef93ac5a87526111f43e5110675032dbcacf56",
	})
	use({
		"nvim-lualine/lualine.nvim",
		commit = "c0510ddec86070dbcacbd291736de27aabbf3bfe",
	})
	use({
		"akinsho/toggleterm.nvim",
		commit = "62683d927dfd30dc68441a5811fdcb6c9f176c42",
	})
	use({
		"ahmedkhalf/project.nvim",
		commit = "090bb11ee7eb76ebb9d0be1c6060eac4f69a240f",
	})
	use({
		"lewis6991/impatient.nvim",
		commit = "49f4ed4a96e0dec3425f270001f341f78400fb49",
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		commit = "c15bbe9f23d88b5c0b4ca45a446e01a0a3913707",
	})
	use({
		"goolord/alpha-nvim",
		commit = "d688f46090a582be8f9d7b70b4cf999b780e993d",
	})
	use("folke/which-key.nvim")

	-- Colorschemes
	use({
		"folke/tokyonight.nvim",
		commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb",
	})
	use("Minimal-Mistakes/minimalmistakes-nvim")

	-- cmp plugins
	use({
		"hrsh7th/nvim-cmp",
		commit = "b1ebdb0a17daaad13606b802780313a32e59781b",
	}) -- The completion plugin
	use({
		"hrsh7th/cmp-buffer",
		commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
	}) -- buffer completions
	use({
		"hrsh7th/cmp-cmdline",
		commit = "9c0e331fe78cab7ede1c051c065ee2fc3cf9432e",
	}) -- cmdline completions
	use({
		"hrsh7th/cmp-path",
		commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1",
	}) -- path completions
	use({
		"saadparwaiz1/cmp_luasnip",
		commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
	}) -- snippet completions
	use({
		"hrsh7th/cmp-nvim-lsp",
		commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
	})
	use({
		"hrsh7th/cmp-nvim-lua",
		commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21",
	})

	-- snippets
	use({
		"L3MON4D3/LuaSnip",
		commit = "b8fa22fc12df7a8c48f5c18156874d40f584265c",
	}) -- snippet engine
	use({
		"rafamadriz/friendly-snippets",
		commit = "b2446100d9f6609526cf1839b4ce3dc1ff07ada0",
	}) -- a bunch of snippets to use

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		commit = "da7461b596d70fa47b50bf3a7acfaef94c47727d",
	}) -- enable LSP
	use({
		"williamboman/nvim-lsp-installer",
		commit = "e3ccf37c044a8e41a945ba03fffc0edb7b4eaaff",
	}) -- simple to use language server installer
	use({
		"jose-elias-alvarez/null-ls.nvim",
		commit = "8914051a3d399e9715833ad76bbf5fe69ea7faf0",
	}) -- for formatters and linters

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		commit = "d793de0f12d874c463e81edabee741b802c1a37a",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "e5c60516b5457b31628ad2c975c9b0dcacb0cbc2",
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		commit = "29468d89e71a0cd04aeb750fcfe75c3163347adf",
	})

	-- Custom
	use({ "wesleimp/stylua.nvim" })
	use({ "cappyzawa/trim.nvim" })
	use({ "ap/vim-css-color" })
	use({ "tpope/vim-fugitive" })
	use({ "airblade/vim-gitgutter" })
	use({ "ctrlpvim/ctrlp.vim" })
	use({ "lyuts/vim-rtags" })
	use({ "wakatime/vim-wakatime" })
	use({ "mboughaba/i3config.vim" })
	use({ "The-Repo-Club/header.nvim" })
	use({ "The-Repo-Club/Vim_Keys" })
	use({ "Thyrum/vim-stabs" })
	use({ "mbbill/undotree" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
