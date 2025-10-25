-- Install Neogit, a Git integration for Neovim.
-- https://github.com/NeogitOrg/neogit

return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"folke/snacks.nvim",
	},
	event = "VeryLazy",
	config = function()
		run_config("neogit")
	end,
}

