require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
vim.wo.relativenumber = true

-- use system clipboard
if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r",""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r",""))',
    },
    cache_enabled = 0,
  }
end

-- vim.cmd[[let g:codeium_server_config = {
--   \'portal_url': 'https://codeium.delllabs.net',
--   \'api_url': 'https://codeium.delllabs.net/_route/api_server' }
-- ]]
