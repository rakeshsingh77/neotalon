local M = {}

function M.setup()
	local ok, output = pcall(require, "toggleterm")
	local terminal_mode
	if ok then
		terminal_mode = "toggleterm"
	else
		terminal_mode = "float"
	end
	require("code_runner").setup({
		config = true,
		mode = terminal_mode,
	})
end

return M
