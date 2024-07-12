return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader><F5>", ":UndotreeToggle<cr>", { desc = "Undo tree" })
    end
}
