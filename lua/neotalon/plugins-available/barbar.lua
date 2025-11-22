-- Install barbar for buffer tabs
-- https://github.com/romgrk/barbar.nvim
return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	event = { "BufReadPre", "BufNewFile" },
	opts = function()
		run_config("barbar")
	end,
	init = function()
		vim.g.barbar_auto_setup = false
	end,
}
