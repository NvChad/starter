local dap = require "dap"
local dapui = require "dapui"

-- First, set up dap-ui
dapui.setup {
  -- Optional: configure layouts
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        {id = "scopes", size = 1.0},
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        -- { id = "scopes", size = 0.3 },
        {id = "repl", size = 1.0},
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
}

-- Automatically open UI when debugging starts
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Add some keymaps for debug terminal
