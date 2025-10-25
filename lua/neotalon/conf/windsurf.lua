local M = {}

function M.setup()
	require("codeium").setup({
		enable_chat = true,
	})
end

return M
