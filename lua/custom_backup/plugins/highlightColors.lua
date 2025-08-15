--Adds colors to color codes
return {
	enabled = false,
  'brenoprata10/nvim-highlight-colors',
  config = function()
    require('nvim-highlight-colors').setup {}
  end,
}
