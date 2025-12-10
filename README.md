**This repo is supposed to be used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

## Installing LSP Servers & Tools

1. Open Mason: `:Mason`
2. Search for tools (press `/` to search)
3. Press `i` to install, `X` to uninstall

**Currently configured:**
- **pyright** - Python LSP (autocompletion, go to definition)
- **ruff** - Python formatter (auto-formats on save)
- Add more in `lua/plugins/init.lua` under `ensure_installed`

Format manually: `<leader>fm` (Space + f + m)

## Python Debugging (DAP)

**Debug shortcuts:**
- `<leader>db` (Space + d + b) - Toggle breakpoint
- `<leader>dc` (Space + d + c) - Start/Continue debugging
- `<leader>di` (Space + d + i) - Step into
- `<leader>do` (Space + d + o) - Step over
- `<leader>dO` (Space + d + Shift+o) - Step out
- `<leader>dt` (Space + d + t) - Stop debugging

**How to debug:**
1. Open a Python file
2. Press `<leader>db` on a line to set a breakpoint
3. Press `<leader>dc` to start debugging
4. Use step over/into to navigate through code

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
