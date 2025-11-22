-- Install the Windsurf (Qodo) AI Code Assistant
-- https://github.com/Exafunction/windsurf.nvim

return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		run_config("windsurf")
	end,
}
