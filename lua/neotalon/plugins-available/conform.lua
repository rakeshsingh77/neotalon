-- Installs the conform.nvim plugin for code formatting
-- https://github.com/stevearc/conform.nvim

return {
	"stevearc/conform.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer",
	},
	after = { "mason-tool-installer" },
	lazy = false,
	opts = {},
	config = function()
		run_config("conform")
	end,
}
