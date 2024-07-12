return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local set = vim.keymap.set

        set("n", "<leader>td", ":TroubleToggle document_diagnostics<cr>", { desc = "Document diagnostics" })
        set("n", "<leader>tw", ":TroubleToggle workspace_diagnostics<cr>", { desc = "Workspace diagnostics" })
    end
}
