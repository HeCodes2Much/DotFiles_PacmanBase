-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NeoVim

local hooks = require "core.hooks"
local status = require("core.utils").load_config().plugins.status

hooks.add("setup_mappings", function(map)
    map("n", "<C-f>", "za <CR>")
    map("n", "<leader>oc", '<cmd> lua require("core.functions").edit_config() <CR>')
end)

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

hooks.add("install_plugins", function(use)
    use {
        "wakatime/vim-wakatime"
    }

    use {
        "gko/vim-coloresque"
    }

    use {
        "liuchengxu/vim-clap"
    }

    use {
        "folke/which-key.nvim",
        config = function()
            require("custom.configs.which-key")
        end
    }
    use {
        "cappyzawa/trim.nvim",
        config = function()
            require("custom.configs.trim")
        end
    }

    use {
        "nvim-lualine/lualine.nvim",
        disable = not status.bufferline,
        config = function()
            require("custom.configs.lualine")
        end
    }

    use {
        "Minimal-Mistakes/vim",
    }
    use {
        "ap/vim-css-color",
    }
    use {
        "jremmen/vim-ripgrep",
    }
    use {
        "tpope/vim-fugitive",
    }
    use {
        "airblade/vim-gitgutter",
    }
    use {
        "leafgarland/typescript-vim",
    }
    use {
        "vim-utils/vim-man",
    }
    use {
        "lyuts/vim-rtags",
    }
    use {
        "mbbill/undotree",
    }
    use {
        "ctrlpvim/ctrlp.vim",
    }
    use {
        "mhinz/vim-startify",
        disable = not status.startify,
        config = function()
            require("custom.configs.startify")
        end
    }
    use {
        "mboughaba/i3config.vim",
    }
    use {
        "The-Repo-Club/Vim_Headers"
    }
    use {
        "The-Repo-Club/Vim_Keys"
    }
end)
