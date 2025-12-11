-- Install which-key to show and manage keymaps
-- https://github.com/folke/which-key.nvim

return {
	"folke/which-key.nvim",
	lazy = false,
	opts = function()
		run_config("which-key")
	end,
}
