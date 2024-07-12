return {
    "goolord/alpha-nvim",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha/themes/dashboard")
        local lazy = require("lazy")
        local session_manager = require("session_manager")
        local session_config = require("session_manager/config")
        local session_utils = require("session_manager/utils")

        local section = dashboard.section

        local headers = {
            {
                "                       ",
                " 78 101 111 86 105 109 ",
                "                       "
            },
            {
                "                     ",
                " -. . --- ...- .. -- ",
                "                     "
            },
            {
                "",
                "neovim",
                ""
            }
        }

        math.randomseed(os.time())
        local index = math.random(#headers)
        section.header.val = headers[index]

        section.buttons.val = {
            dashboard.button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
            dashboard.button("e", "󰔱  Tree", "<cmd>NvimTreeToggle<cr>"),
            dashboard.button("a", "󰈔  New file", function()
                vim.ui.input({
                    prompt = "File name: "
                }, function(input)
                    if input ~= nil then
                        vim.cmd("e " .. input .. "<cr>")
                    end
                end)
            end),
            dashboard.button("l", "  Load last session", session_manager.load_last_session),
            dashboard.button("s", "  Load session", session_manager.load_session),
            dashboard.button("d", "󱞁  TODO", "<cmd>TodoLocList<cr>"),
            dashboard.button("t", "󰏘  Change colorscheme", "<cmd>Telescope colorscheme<cr>"),
            -- dashboard.button("p", "󰒲  Lazy", ":Lazy<cr>"),
            dashboard.button("c", "  Open config", function()
                vim.cmd("e " .. vim.fn.stdpath("config"))
                vim.cmd("SessionManager load_current_dir_session")
            end),
            dashboard.button("q", "  Quit", "<cmd>qa!<cr>")
        }

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function(args)
                local stats = lazy.stats()

                section.footer.val = {
                    "",
                    "Cwd: " .. vim.fn.getcwd(),
                    "Startup time: " .. stats.startuptime,
                    "Pugins: " .. stats.count,
                    "Version: " .. tostring(vim.version())
                }

                local filename = session_utils.get_last_session_filename()

                if filename ~= nil then
                    local last_session_name = filename:sub(#tostring(session_config.sessions_dir) + 2)

                    last_session_name = last_session_name:gsub("++", ":")
                    last_session_name = last_session_name:gsub("__", "/")
                    last_session_name = "Last session: " .. last_session_name

                    table.insert(section.footer.val, 2, last_session_name)
                end

                alpha.redraw()
            end
        })

        alpha.setup(dashboard.opts)
    end
}
