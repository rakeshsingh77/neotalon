local M = {}

function M.setup()
	local lang_formatters = get_lang_formatters()
	ok, output = pcall(require, "mason-tool-installer")
	if not ok then
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
