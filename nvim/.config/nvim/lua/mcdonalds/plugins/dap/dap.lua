return {
    "mfussenegger/nvim-dap",
    lazy = false,
    config = function()
        local dap = require("dap")
        local widgets = require("dap/ui/widgets")
        local set = vim.keymap.set

        set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
        set("n", "<leader>dc", dap.continue, { desc = "Start or stop debugging" })
        set("n", "<F6>", dap.terminate, { desc = "Terminate debugging" })
        set("n", "<F10>", dap.step_over, { desc = "Step over" })
        set("n", "<F11>", dap.step_into, { desc = "Step into" })
        set("n", "<F12>", dap.step_out, { desc = "Step out" })

        set("n", "<leader>dh", widgets.hover, { desc = "View value of the expression under the cursor" })
        set("n", "<leader>dp", widgets.preview, { desc = "View value of the expression under the cursor in a separate window" })

        local function executable_path_dialog()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end

        local default_adapters = {
            lldb = {
                type = "executable",
                command = "lldb-vscode-14",
                name = "lldb"
            },
            coreclr = {
                type = 'executable',
                command = '/usr/local/netcoredbg',
                args = {'--interpreter=vscode'}
            }
        }

        local default_configurations = {
            c = {
                {
                    name = "Launch",
                    type = "lldb",
                    request = "launch",
                    program = executable_path_dialog,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                }
            },
            cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = executable_path_dialog
                }
            }
        }

        dap.adapters = default_adapters
        dap.configurations = default_configurations

        local local_config_filename = "./.nvim/dap-config.lua"

        local function load_default_config()
            dap.adapters = default_adapters
            dap.configurations = default_configurations
        end

        local function load_local_config()
            if vim.fn.filereadable(local_config_filename) == 0 then
                load_default_config()
                print(".nvim/dap-config.lua not found, applying default config")

                return
            end

            local success, config = pcall(dofile, local_config_filename)

            if success then
                dap.adapters = config.adapters
                dap.configurations = config.configurations

                print("Loaded local DAP config")
            else
                load_default_config()

                print("Error executing .nvim/dap-config.lua, applying default config")
            end
        end

        set("n", "<F8>", load_local_config, { desc = "Load local DAP config" })

        vim.api.nvim_create_autocmd("User", {
            pattern = "SessionLoadPost",
            callback = load_local_config
        })

        vim.api.nvim_create_user_command("LoadDAPConfig", load_local_config,
            { desc = "Loads local DAP config from .nvim/dap-config.lua" })

        dap.set_log_level("TRACE")
    end
}
