return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        -- only works with using "." as a separator
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            ensure_isntalled = {
                "c",
                "lua",
                "rust",
                "glsl",
                "make",
                "json"
            },
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true
            }
        })
    end
}
