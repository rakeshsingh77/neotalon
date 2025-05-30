-- Install the toggleterm plugin which can persist and toggle
-- multiple terminal instances
-- https://github.com/akinsho/toggleterm.nvim

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = true,
	event = "VeryLazy",
	opts = function()
		run_config("toggleterm")
	end,
}
