local dap = require("dap")
local dapui = require("dapui")

-- Setup DAP UI
dapui.setup()

-- Setup Python debugger
require("dap-python").setup("python3")

-- Auto open/close UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

