local M = {}

function M.setup()
	require("toggleterm").setup({
		open_mapping = TOGGLETERM_KEY,
		size = 20,
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = false,
		insert_mappings = true,
		persist_size = true,
		direction = "horizontal",
		close_on_exit = true,
		shell = vim.o.shell,
	})
end

return M
