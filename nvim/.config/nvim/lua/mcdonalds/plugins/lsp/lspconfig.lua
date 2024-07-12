return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {
            "SmiteshP/nvim-navbuddy",
            dependencies = {
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim"
            },
            opts = {
                lsp = {
                    auto_attach = true
                }
            },
            config = function()
                local navbuddy = require("nvim-navbuddy")

                vim.keymap.set("n", "<leader>nb", ":Navbuddy<cr>")

                navbuddy.setup({
                    lsp = {
                        auto_attach = true
                    },
                    source_buffer = {
                        follow_node = true
                    }
                })
            end
        }
    },
    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.clangd.setup({})

        lspconfig.rust_analyzer.setup({})

        lspconfig.csharp_ls.setup({})

        lspconfig.lua_ls.setup({
            on_init = function(client)
                local path = client.workspace_folders[1].name

                if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                    return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                        }
                    }
                })
            end,

            settings = {
                Lua = {}
            }
        })

        lspconfig.jsonls.setup({})

        lspconfig.glslls.setup({
            cmd = { 'glslls', '--stdin', '--target-env', 'opengl' },
        })

        lspconfig.autotools_ls.setup({})

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(event)
                local set = vim.keymap.set

                set("n", "gD", vim.lsp.buf.declaration, { desc = "Jump to declaration" })
                set("n", "gd", ":Telescope lsp_definitions<cr>", { desc = "Show definitions" })
                set("n", "gr", ":Telescope lsp_references<cr>", { desc = "Show references" })
                set("n", "gi", ":Telescope lsp_implementations<cr>", { desc = "Show implementations" })
                set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
                set("n", "gf", vim.lsp.buf.format, { desc = "Format buffer" })
                set("n", "ga", vim.lsp.buf.code_action, { desc = "Code actions" })

                set("n", "K", vim.lsp.buf.hover, { desc = "Display hover information" })

                vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
                    vim.lsp.diagnostic.on_publish_diagnostics, {
                        -- Just to be able to quickly toggle that on
                        update_in_insert = false
                    }
                )
            end
        })
    end
}
