local M = {}

function M.setup()
	require("gitsigns").setup({
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
		current_line_blame = true,
	})
	vim.opt.signcolumn = SIGN_COLUMN
end

return M
