return {
    "chentoast/marks.nvim",
    config = function()
        local marks = require("marks")

        marks.setup({
            default_mappings = false,
            mappings = {
                toggle = "mm",
                delete_buf = "md",
                next = "mk",
                prev = "mj",
                preview = "mp"
            }
        })
    end
}
