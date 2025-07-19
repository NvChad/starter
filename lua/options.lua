require "nvchad.options"

-- add yours here!

local opt = vim.opt

-- Indentation and tab settings
opt.expandtab = true         -- Use spaces instead of tabs
opt.tabstop = 4              -- A tab equals 4 spaces
opt.shiftwidth = 4           -- Indent by 4 spaces when shifting (>> or <<)
opt.softtabstop = 4          -- Number of spaces a <Tab> counts for during editing

-- Line wrapping and long line behavior
opt.textwidth = 0            -- Do not auto-wrap lines
opt.wrap = false             -- Disable soft wrap
opt.linebreak = false        -- Do not break lines at word boundaries

-- Allow cursor to move one character past the end of the line
opt.virtualedit = "onemore"

-- Visual cues for hidden characters
opt.showbreak = "↪ "         -- Symbol shown at the beginning of wrapped lines
opt.list = true              -- Show hidden characters
opt.listchars = {
  tab = "▸ ",                -- Display tabs as ▸
  trail = "·",               -- Display trailing spaces as ·
  extends = "❯",             -- Show ❯ at the end of a long line
  precedes = "❮",            -- Show ❮ at the beginning of a truncated line
}

-- UI enhancements
opt.cursorline = true        -- Highlight current line
opt.cursorlineopt ='both'    -- to enable cursorline!
opt.number = true            -- Show line numbers
-- opt.relativenumber = true    -- Show relative line numbers
opt.signcolumn = "yes"       -- Always show the sign column

-- Search behavior
opt.ignorecase = true        -- Ignore case in search patterns
opt.smartcase = true         -- Override ignorecase if search contains uppercase

-- Buffer behavior
opt.hidden = true            -- Allow switching buffers without saving

-- Split window behavior
opt.splitbelow = true        -- Horizontal splits open below
opt.splitright = true        -- Vertical splits open to the right


-- Automatically change the working directory to the current buffer's file directory
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local filepath = vim.api.nvim_buf_get_name(0)
    if filepath ~= "" then
      local dir = vim.fn.fnamemodify(filepath, ":p:h")
      vim.cmd("lcd " .. dir)  -- use "cd" instead of "lcd" for global dir change
    end
  end,
})

-- Auto-remove trailing whitespace and tabs on file save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- Remove trailing whitespace
    vim.cmd([[%s/\s\+$//e]])
  end,
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
