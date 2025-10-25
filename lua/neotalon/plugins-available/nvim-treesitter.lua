-- Install the NVIM Treesitter plugin which provides syntax highlighting and code folding
-- by parsing the code using the Treesitter library.
-- https://github.com/nvim-treesitter/nvim-treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile", "VeryLazy" },
	opts = function()
		run_config("nvim-treesitter")
	end,
}
