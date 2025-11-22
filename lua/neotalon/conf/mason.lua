local M = {}

function M.setup()
	require("mason").setup({
		ui = {
			border = "rounded",
			border_highlight = "FloatBorder",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
end

return M
