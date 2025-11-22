-- Install the mason-lspconfig which bridges the gap between mason and
-- lspconfig to make it simpler to use these plugins together.
-- https://github.com/mason-org/mason-lspconfig.nvim

return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer",
	},
	after = { "mason-tool-installer" },
	config = function()
		run_config("mason-lspconfig")
	end,
}

