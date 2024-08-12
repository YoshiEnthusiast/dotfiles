return {
    "nvim-telescope/telescope.nvim", tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope/actions")

        telescope.setup({
            defaults = {
                file_ignore_patterns = { "^include/" },
                layout_config = {
                    horizontal = {
                        preview_cutoff = 0,
                    },
                },
                preview = {
                    filesize_limit = 0.1,
                },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next
                    }
                },
                borderchars = {
                    results = {"─", "│", " ", "│", "┌", "┐", "│", "│"},
                    prompt = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
                    preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└"},
                }
            }
        })


        local set = vim.keymap.set

        set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Telescope find files" })
        set("n", "<leader>fg", ":Telescope live_grep<cr>", { desc = "Telescope live grep" })
        set("n", "<leader>fd", ":TodoTelescope<cr>", { desc = "Telscope TODO" })
    end
}
