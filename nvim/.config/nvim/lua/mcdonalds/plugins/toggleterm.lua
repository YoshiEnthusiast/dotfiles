return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")

        toggleterm.setup({
            size = 20,
            open_mapping = "<C-/>",
            autochdir = true,
            direction = "horizontal",
            auto_scroll = true,
            close_on_exit = true,
        })
    end
}
