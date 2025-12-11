-- Gitsigns is a plugin that shows git diff signs in the sign column,
-- and allows you to stage/unstage hunks and navigate between them.
-- https://github.com/lewis6991/gitsigns.nvim

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile", "BufWritePost" },
	opts = {},
	config = function()
		run_config("gitsigns")
	end,
}
