-- Auto-activate Python virtual environment if found in parent directories
-- Advanced: supports multiple filetypes and custom venv names

local M = {}

-- List of virtual environment directory names to search for
M.venv_names = { "venv", ".venv", "env", "envs", "pyenv", "myenv" }

-- Filetypes that should trigger venv activation
M.filetypes = { "python", "jupyter", "ipynb" }

-- Track last activated venv to prevent infinite loop
M.last_venv_path = nil

-- Helper: search up the directory tree for a venv
local function find_venv(start_path, venv_names)
  local util = require("lspconfig.util")
  for _, name in ipairs(venv_names) do
    local match = util.search_ancestors(start_path, function(path)
      local venv_dir = util.path.join(path, name)
      if vim.fn.isdirectory(venv_dir) == 1 then
        return venv_dir
      end
    end)
    if match then return match end
  end
  return nil
end

-- Main function: activate venv if found
function M.activate_venv()
  local buf_ft = vim.bo.filetype
  for _, ft in ipairs(M.filetypes) do
    if buf_ft == ft then
      local cwd = vim.fn.getcwd()
      local venv_path = find_venv(cwd, M.venv_names)
      -- Only activate/restart if venv changed
      if venv_path and venv_path ~= M.last_venv_path then
        vim.env.VIRTUAL_ENV = venv_path
        local sep = package.config:sub(1,1)
        local bin_dir = (sep == "\\") and (venv_path .. "\\Scripts") or (venv_path .. "/bin")
        vim.env.PATH = bin_dir .. sep .. ":" .. vim.env.PATH
        vim.notify("Activated Python venv: " .. venv_path, vim.log.levels.INFO)
        -- Restart pyright LSP so it picks up the new venv
        for _, client in pairs(vim.lsp.get_clients()) do
          if client.name == "pyright" then
            vim.lsp.stop_client(client.id)
          end
        end
        -- Reattach LSP to current buffer
        vim.defer_fn(function()
          vim.cmd("edit")
        end, 100)
        M.last_venv_path = venv_path
      end
      break
    end
  end
end

-- Autocmd: activate venv on BufEnter for relevant filetypes
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    M.activate_venv()
  end,
})

return M
