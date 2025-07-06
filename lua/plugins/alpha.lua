return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")  -- switched to dashboard theme

        local icons = {
            fileNoBg = " ",
            t = " ",
            fileCopy = " ",
            timer = " ",
            container = " ",
            vim = " ",
        }

        dashboard.section.header.val = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("a", icons.fileNoBg .. "Find File          ", ":Telescope find_files hidden=true<CR>"),
            dashboard.button("b", icons.t .. "Find Word          ", ":Telescope live_grep<CR>"),
            dashboard.button("c", icons.fileCopy .. "Recents            ", ":Telescope oldfiles hidden=true<CR>"),
            dashboard.button("d", icons.timer .. "Load Last Session  ", ":SessionLoad<CR>"),
            dashboard.button("e", icons.container .. "Sync Plugins       ", ":PackerSync<CR>"),
            dashboard.button("f", icons.container .. "Install Plugins    ", ":PackerInstall<CR>"),
            dashboard.button("g", icons.vim .. "Settings           ", ":edit $MYVIMRC<CR>"),
            dashboard.button("h", icons.container .. "Exit               ", ":qa<CR>"),
        }


        alpha.setup(dashboard.opts)
    end,
}

