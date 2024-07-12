return {
    "jakemason/ouroboros",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local ouroboros = require("ouroboros")

        ouroboros.setup({})

        vim.keymap.set("n", "<leader>hh", "<cmd>Ouroboros<cr>", { desc = "Switch between c and header files" })
    end
}
