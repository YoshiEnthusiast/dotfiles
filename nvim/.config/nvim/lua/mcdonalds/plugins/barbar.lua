return {
    "romgrk/barbar.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    version = "^1.0.0",
    enabled = false,
    config = function()
        vim.g.barbar_auto_setup = false

        local barbar = require("barbar")

        barbar.setup({
            animation = false,
            tabpages = false,
            clickable = false
        })

        local set = vim.keymap.set

        set("n", "<A-h>", "<cmd>BufferPrevious<cr>")
        set("n", "<A-l>", "<cmd>BufferNext<cr>")

        set("n", "<A-,>", "<cmd>BufferMovePrevious<cr>")
        set("n", "<A-.>", "<cmd>BufferMoveNext<cr>")

        set("n", "<A-p>", "<cmd>BufferPick<cr>")
        set("n", "<A-o>", "<cmd>BufferPin<cr>")
        set("n", "<A-d>", "<cmd>BufferClose<cr>")
    end
}
