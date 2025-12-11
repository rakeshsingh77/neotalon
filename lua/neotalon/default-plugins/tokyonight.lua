-- A clean, dark theme with a vibrant color palette for Neovim
-- The default for NeoTalon
-- https://github.com/folke/tokyonight.nvim

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		run_config("tokyonight")
	end,
}
