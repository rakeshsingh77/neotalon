-- Conform configuration
-- Code formatter plugin configuration
---@class ConformConfig
local M = {}

---@type fun(): nil
function M.setup()
	local lang_formatters = get_lang_formatters()
	local ok, mti = pcall(require, "mason-tool-installer")
	if not ok then
		vim.notify("conform.setup: mason-tool-installer not available", vim.log.levels.WARN)
		return
	end
	require("conform").setup({
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 1000,
		},
		formatters_by_ft = lang_formatters,
	})
end
return M
