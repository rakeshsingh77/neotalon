local M = {}

function M.setup()
	require("barbar").setup({
		maximum_length = 16,
	})
end

return M
