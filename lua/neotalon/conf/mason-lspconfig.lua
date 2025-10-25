local M = {}

function M.setup()
	require("mason-lspconfig").setup({
		automatic_enable = true,
	})
end

return M
