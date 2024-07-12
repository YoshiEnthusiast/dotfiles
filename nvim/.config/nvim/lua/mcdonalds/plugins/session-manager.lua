return {
    "Shatur/neovim-session-manager",
    config = function()
        local session_manager = require("session_manager")
        local config = require("session_manager/config")

        local options = config.defaults
        options.autoload_mode = config.AutoloadMode.Disabled

        vim.keymap.set("n", "<leader>ls", ":SessionManager load_session<cr>", { desc = "Load session" })

        session_manager.setup(options)
    end
}
