return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local nvim_tree = require("nvim-tree")
        local api = require("nvim-tree/api")
        local set = vim.keymap.set
        local tree = api.tree
        local node = api.node

        local function on_attach(bufnr)
            local function options(desc)
                return {
                    desc = "nvim-tree: " .. desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true
                }
            end

            api.config.mappings.default_on_attach(bufnr)

            set("n", "<leader>er", tree.reload)

            -- open file and toggle on enter
            -- and just open on shift + enter???
            set("n", "<C-CR>", function()
                node.open.edit()
                tree.toggle()
            end)
        end

        set("n", "<leader>ee", tree.toggle)

        nvim_tree.setup({
            update_focused_file = {
                enable = true,
                update_root = true,
            },
            view = {
                width = 25,
                relativenumber = true
            },
            renderer = {
                indent_markers = {
                    enable = true
                }
            },
            on_attach = on_attach
        })
    end,
}
