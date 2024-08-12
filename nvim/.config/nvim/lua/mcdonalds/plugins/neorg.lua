return {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    config = function()
        local neorg = require("neorg")

        neorg.setup({
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {
                    config = {
                        icon_preset = "varied",
                    },
                }
            }
        })
    end
}
