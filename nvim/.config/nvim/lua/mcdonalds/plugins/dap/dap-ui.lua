return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio"
    },
    config = function()
        local dap = require("dap")
        local dap_ui = require("dapui")

        dap_ui.setup()

        local open = dap_ui.open
        local close = dap_ui.close

        local listeners = dap.listeners.before

        listeners.attach.dap_ui_config = open
        listeners.launch.dap_ui_config = open

        listeners.event_terminated.dap_ui_config = close
        listeners.event_exited.dap_ui_config = close
    end
}
