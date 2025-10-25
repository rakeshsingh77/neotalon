local M = {}

function M.setup()
	require("telescope").setup({
		-- Defaults are fine but can be overridden here
		variant = "dark",
	})
end

return M
