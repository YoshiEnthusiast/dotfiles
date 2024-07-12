require("mcdonalds/options")
require("mcdonalds/keymaps")
require("mcdonalds/lazy")
require("mcdonalds/neovide")

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    callback = function(args)
        local bo = vim.bo
        if bo.buftype == "" and bo.modified
            and vim.fn.bufname() ~= "" then
            vim.cmd("silent w")
        end
    end
})

local last_color = require("last-color")
local colorscheme = last_color.recall() or "kanagawa"
vim.cmd("colorscheme " .. colorscheme)
