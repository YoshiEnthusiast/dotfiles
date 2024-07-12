return {
    "stevearc/oil.nvim",
    opts = {},
    config = function()
        local oil = require("oil")

        oil.setup({
            default_file_explorer = false,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true
            }
        })

        vim.keymap.set("n", "<leader>eo", ":Oil<cr>", { desc = "Open Oil" })
        vim.keymap.set("n", "-", ":Oil<cr>", { desc = "Open Oil" })
    end
}
