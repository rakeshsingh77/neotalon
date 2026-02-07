-- Telescope configuration
---@class TelescopeConfig
local M = {}

---@type fun(): nil
function M.setup()
	local ok, telescope = pcall(require, "telescope")
	if not ok then
		vim.notify("telescope.setup: telescope not available", vim.log.levels.WARN)
		return
	end

	telescope.setup({
		-- Defaults are fine but can be overridden here
		variant = "dark",
	})
end

return M
