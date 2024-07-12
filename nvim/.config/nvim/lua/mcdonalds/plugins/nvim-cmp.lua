return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
    },
    config = function()
        local cmp = require("cmp")

        local mapping = cmp.mapping

        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" }
            },
            mapping = mapping.preset.insert({
                ["<C-k>"] = mapping.select_prev_item(),
                ["<C-j>"] = mapping.select_next_item(),
                ["<C-u>"] = mapping.scroll_docs(-4),
                ["<C-d>"] = mapping.scroll_docs(4),
                ['<C-Space>'] = mapping.complete(),
                ['<C-x>'] = mapping.abort(),
                ['<CR>'] = mapping.confirm({ select = true })
            }),
            formatting = {
                format = function(entry, vim_item)
                    vim_item.abbr = string.sub(vim_item.abbr, 1, 30)

                    local source = entry.source.name
                    vim_item.menu = "[" .. source .. "]"

                    return vim_item
                end
            }
        })

        local cmp_mapping = cmp.mapping.preset.cmdline({
            ["<C-w>"] = mapping.abort()
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp_mapping,
            sources = {
                { name = "buffer" }
            }
        })

        cmp.setup.cmdline(":", {
            mapping = cmp_mapping,
            sources = {
                { name = "path" },
                { name = "cmdline" }
            },
            matching = { disallow_symbol_nonprefix_matching = false }
        })
    end
}
