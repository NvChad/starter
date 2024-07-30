local options = {
  enable_chat = true,
}
vim.keymap.set("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
vim.keymap.set("i", "<C-;>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<C-,>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })
vim.keymap.set("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })
-- require("codeium.vim").setup(options)

vim.cmd [[let g:codeium_server_config = {
  \'portal_url': 'https://codeium.delllabs.net',
  \'api_url': 'https://codeium.delllabs.net/_route/api_server' }
]]
