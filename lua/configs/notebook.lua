-- Notebook utilities
local M = {}

-- Create a new notebook from a template
function M.new_notebook(filename)
  -- Default filename if not provided
  if not filename or filename == "" then
    filename = vim.fn.input("Notebook name: ", "", "file")
    if filename == "" then
      print("Cancelled")
      return
    end
  end

  -- Add .md extension if not present
  if not filename:match("%.md$") then
    filename = filename .. ".md"
  end

  -- Create the file with a basic template
  local template = [[---
title: "]] .. filename:gsub("%.md$", "") .. [["
jupyter:
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

# ]] .. filename:gsub("%.md$", "") .. [[


## Setup

```{python}
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
```

## Analysis

```{python}

```
]]

  -- Write the template to the file
  vim.fn.writefile(vim.split(template, "\n"), filename)

  -- Open the file
  vim.cmd("edit " .. filename)

  -- Initialize Molten for this buffer
  vim.cmd("MoltenInit python3")

  print("Created notebook: " .. filename)
end

return M
