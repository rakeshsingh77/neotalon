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
