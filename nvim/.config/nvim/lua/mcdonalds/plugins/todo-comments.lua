return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local comments = require("todo-comments")

        comments.setup({
            signs = false
        })

        vim.keymap.set("n", "<leader>tg", "<cmd>TodoLocList<cr>")
    end
}
