return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        local gruvbox = require("gruvbox")

        gruvbox.setup({
            invert_selection = true,
            italic = {
                strings = false
            }
        })
    end
}
