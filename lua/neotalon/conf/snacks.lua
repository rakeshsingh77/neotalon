local M = {}

function M.setup()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	vim.api.nvim_create_user_command("Ex", "lua Snacks.picker.explorer()", {})
	vim.api.nvim_create_autocmd("VimEnter", {
		callback = function()
			local args = vim.fn.argv()
			if #args > 0 and vim.fn.isdirectory(args[1]) == 1 then
				vim.defer_fn(function() Snacks.picker.explorer() end, 1)
			end
		end,
	})
	local Snacks = require("snacks")
	Snacks.setup(SNACK_PLUGINS)
	---@type snacks.Config
	opts = SNACK_PLUGINS
end

return M
