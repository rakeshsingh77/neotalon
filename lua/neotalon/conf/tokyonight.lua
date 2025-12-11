local M = {}

function M.setup()
	require("tokyonight").setup({
		-- Available styles: storm, moon, day, night
		style = COLORSCHEME_VARIANT or "night",
		transparent = TRANSPARENT or false,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
	})
end

return M
