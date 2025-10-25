-- Install the popular Catppuccin theme for Neovim
-- https://github.com/catppuccin/nvim

return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		run_config("catppuccin")
	end,
}
