local M = {}

function M.setup()
	local lang_linters = get_lang_linters() or {}
	ok, output = pcall(require, "mason-tool-installer")
	if not ok then
		return
	end
	require("lint").linters_by_ft = lang_linters
end

return M
