-- Installs the Code Companion plugin
-- https://codecompanion.olimorris.dev/
return {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ravitemer/mcphub.nvim",
   		"nvim-treesitter/nvim-treesitter"
	},
	config = function()
		run_config("code-companion")
	end,
}
