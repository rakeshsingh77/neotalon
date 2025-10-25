local M = {}

function M.setup()
	require("mason").setup()
	require("mason-nvim-dap").setup({
		automatic_installation = true,
		ensure_installed = {},
	})
end

return M
