-- Catppuccin configuration
-- The variant can be set by defining COLORSCHEME_VARIANT in the vars.lua file.
-- Options include "latte", "frappe", "macchiato", and "mocha". 
-- The default is "mocha".
local M = {}

function M.setup()
	require("catppuccin").setup({
		flavour = COLORSCHEME_VARIANT or "mocha",
		transparent_background = TRANSPARENT or false,
		term_colors = true,
		styles = {},
	})
end

return M
