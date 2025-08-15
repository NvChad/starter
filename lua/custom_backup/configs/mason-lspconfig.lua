-- Only install specific LSP servers via Mason
local servers_to_install = {
  "pyright",    -- Python
  "lua_ls",     -- Lua
  "html",       -- HTML
  "cssls",      -- CSS
  "jsonls",     -- JSON
  "dockerls",   -- Docker
}

local lspconfig = require("lspconfig")

return function()
  require("mason-lspconfig").setup({
    ensure_installed = servers_to_install,
    automatic_installation = false,
  })

  -- Setup pyright with dynamic pythonPath
  lspconfig.pyright.setup({
	on_init = function(client)
	  local venv = vim.env.VIRTUAL_ENV
	  if venv then
		local sep = package.config:sub(1,1)
		local python_executable = (sep == "\\") and (venv .. "\\Scripts\\python.exe") or (venv .. "/bin/python")
		client.config.settings = client.config.settings or {}
		client.config.settings.python = client.config.settings.python or {}
		client.config.settings.python.pythonPath = python_executable
		client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
	  end
	end,
    -- Add any other settings you need here
  })
end
