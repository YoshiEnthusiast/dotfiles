return {
    "dstein64/nvim-scrollview",
    config = function()
        local scrollview = require("scrollview")

        scrollview.setup({
            base = "right",
            column = 2,
            current_only = true,
            include_end_region = true,
            signs_on_startup = {}
        })
    end
}
