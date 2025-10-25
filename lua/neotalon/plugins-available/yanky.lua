-- Install the yanky plugin for enhanced yank and paste functionality
-- https://github.com/gbprod/yanky.nvim

return {
	"gbprod/yanky.nvim",
	lazy = true,
	event = "VeryLazy",
	dependencies = { "folke/snacks.nvim" },
	opts = function()
		run_config("yanky")
	end,
}
