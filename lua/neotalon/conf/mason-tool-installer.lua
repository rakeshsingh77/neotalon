
local M = {}

function M.setup()
	require("mason-tool-installer").setup({
		run_on_start = false,
		ensure_installed = {},
		auto_update = true,
		integrations = {
			["mason-lspconfig"] = true,
			["mason-nvim-dap"] = true,
		},
	})
end

return M
