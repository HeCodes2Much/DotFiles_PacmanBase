local fn = vim.fn

-- Install packer
local install_path = vim.fn.stdpath 'data' ..
                         '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                       install_path)
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("packer_user_config", {clear = true}),
    pattern = "plugins.lua",
    callback = function()
        vim.cmd("source <afile>")
        require("packer").sync()
    end
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({border = "rounded"})
        end
    }
})

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here

    use({"wbthomason/packer.nvim"}) -- Have packer manage itself
    use({"windwp/nvim-autopairs"}) -- Autopairs, integrates with both cmp and treesitter
    use({"numToStr/Comment.nvim"})
    use({"JoosepAlviste/nvim-ts-context-commentstring"})
    use({"kyazdani42/nvim-web-devicons"})
    use({"akinsho/bufferline.nvim"})
    use({"moll/vim-bbye"})
    use({"nvim-lualine/lualine.nvim"})
    use({"akinsho/toggleterm.nvim"})
    use({"ahmedkhalf/project.nvim"})
    use({"lewis6991/impatient.nvim"})
    use({"lukas-reineke/indent-blankline.nvim"})
    use({"goolord/alpha-nvim"})
    use({"folke/which-key.nvim"})

    -- Colorschemes
    use({"folke/tokyonight.nvim"})
    use({"Minimal-Mistakes/minimalmistakes-nvim"})

    -- CMP plugins
    use { -- Autocompletion
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer', -- buffer completions
            'hrsh7th/cmp-cmdline', -- cmdline completions
            'hrsh7th/cmp-path', -- path completions
            'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-nvim-lua', 'L3MON4D3/LuaSnip', -- snippet engine
            'rafamadriz/friendly-snippets', -- a bunch of snippets to use
            'saadparwaiz1/cmp_luasnip'
        }
    }

    -- LSP
    use({ -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim'
        }
    }) -- enable LSP
    use {
        'j-hui/fidget.nvim',
        tag = 'legacy',
    }
    use({"jose-elias-alvarez/null-ls.nvim"}) -- for formatters and linters

    -- Telescope Fuzzy Finder (files, lsp, etc)
    use({"nvim-telescope/telescope.nvim", requires = {'nvim-lua/plenary.nvim'}})

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable 'make' == 1
    }

    -- Treesitter
    use { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update {with_sync = true})
        end
    }

    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter'
    }

    -- Git
    use({"tpope/vim-fugitive"})
    use({"tpope/vim-rhubarb"})
    use({"lewis6991/gitsigns.nvim"})

    -- Custom
    use({"wesleimp/stylua.nvim"})
    use({"cappyzawa/trim.nvim"})
    use({"ap/vim-css-color"})
    use({"airblade/vim-gitgutter"})
    use({"ctrlpvim/ctrlp.vim"})
    use({"lyuts/vim-rtags"})
    use({"wakatime/vim-wakatime"})
    use({"mboughaba/i3config.vim"})
    use({"The-Repo-Club/header.nvim"})
    use({"The-Repo-Club/Vim_Keys"})
    use({"Thyrum/vim-stabs"})
    use({"mbbill/undotree"})
    use({"tpope/vim-sleuth"}) -- Detect tabstop and shiftwidth automatically

    -- When we are bootstrapping a configuration, it doesn't
    -- make sense to execute the rest of the init.lua.

    -- You'll need to restart nvim, and then it will work.
    if is_bootstrap then require("packer").sync() end
end)
