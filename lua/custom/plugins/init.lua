-- Custom plugins loader for easy plugin management
-- Put your custom plugins in this directory as separate .lua files
-- Each file should return a plugin configuration

-- This init.lua automatically loads all .lua files in the custom/plugins directory
local M = {}

-- Get the path to custom plugins directory
local custom_plugins_path = vim.fn.stdpath("config") .. "/lua/custom/plugins"

-- Function to load all custom plugin files
local function load_custom_plugins()
  local plugins = {}
  
  -- Check if directory exists
  if vim.fn.isdirectory(custom_plugins_path) == 0 then
    return plugins
  end
  
  -- Get all .lua files in the custom plugins directory
  local files = vim.fn.glob(custom_plugins_path .. "/*.lua", false, true)
  
  for _, file in ipairs(files) do
    -- Skip init.lua (this file)
    if not file:match("init%.lua$") then
      local filename = vim.fn.fnamemodify(file, ":t:r")
      local ok, plugin_config = pcall(require, "custom.plugins." .. filename)
      
      if ok then
        -- If the plugin config is a table, add it
        if type(plugin_config) == "table" then
          -- Check if it's a single plugin or multiple plugins
          if plugin_config[1] and type(plugin_config[1]) == "string" then
            -- Single plugin config
            table.insert(plugins, plugin_config)
          else
            -- Multiple plugins or complex config
            for _, config in pairs(plugin_config) do
              if type(config) == "table" and config[1] then
                table.insert(plugins, config)
              end
            end
          end
        end
      else
        vim.notify("Failed to load custom plugin: " .. filename, vim.log.levels.WARN)
      end
    end
  end
  
  return plugins
end

-- Load and return all custom plugins
return load_custom_plugins()
