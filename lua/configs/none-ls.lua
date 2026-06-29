local none_ls = require("none-ls")

return {
  sources = {
    -- Mypy with pyproject.toml support
    none_ls.builtins.diagnostics.mypy.with({
      extra_args = function(params)
        local root = params.root
        if root then
          local pyproject_path = root .. "/pyproject.toml"
          if vim.fn.filereadable(pyproject_path) == 1 then
            return {"--config-file", pyproject_path}
          end
        end
        return {}
      end,
    }),
    
    -- Ruff for linting and formatting
    -- none_ls.builtins.diagnostics.ruff,
    -- none_ls.builtins.formatting.ruff,
    
    -- Pylint if you want it
    -- none_ls.builtins.diagnostics.pylint.with({
    --   extra_args = function(params)
    --     local root = params.root
    --     if root then
    --       local pyproject_path = root .. "/pyproject.toml"
    --       if vim.fn.filereadable(pyproject_path) == 1 then
    --         return {"--rcfile", pyproject_path}
    --       end
    --     end
    --     return {}
    --   end,
    -- }),
  },
}
