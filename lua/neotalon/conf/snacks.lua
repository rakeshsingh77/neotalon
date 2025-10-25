local M = {}

function M.setup()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	vim.api.nvim_create_user_command("Ex", "lua Snacks.picker.explorer()", {})
	local Snacks = require("snacks")
	Snacks.setup(SNACK_PLUGINS)
	if Snacks.animate.enabled() then
		vim.g.snacks_animate = true
	end
end

return M
