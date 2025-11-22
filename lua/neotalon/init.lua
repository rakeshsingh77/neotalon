-- Source all variable files in the vars directory
require("neotalon.vars.colors")
require("neotalon.vars.snacks")
require("neotalon.vars.vim")
LANGUAGES = require("neotalon.vars.languages")
_G.vim = vim

-- Source the default vim key mappings
require("neotalon.keymaps.vim")

-- Load other required configurations
require("neotalon.conf.vim")

-- Load Neotalon functions
require("neotalon.functions")

-- Install and configure the Lazy Plugin Manager
require("neotalon.conf.lazy")

-- Set the colorscheme
local status, _ = pcall(vim.cmd.colorscheme, COLORSCHEME)
if not status then
	local msg = "Colorscheme '" .. COLORSCHEME .. "' not found. Falling back to '" .. FALLBACK_COLORSCHEME .. "'."
	vim.notify(msg, vim.log.levels.WARN)
	vim.cmd.colorscheme(FALLBACK_COLORSCHEME)
	return
end

-- Auto install mason tools based on filetype
local ok, mti = pcall(require, "mason-tool-installer")
if ok then
	vim.api.nvim_create_autocmd("FileType", {
		callback = function()
			local file_type = vim.bo.filetype
			local lsp_servers = get_lsps(file_type) or {}
			local linters = get_linters(file_type) or {}
			local formatters = get_formatters(file_type) or {}
			local debuggers = get_debuggers(file_type) or {}
			local tools_to_install = merge_lists(lsp_servers, linters, formatters, debuggers)
			local registry = require("mason-registry")
			if #tools_to_install > 0 then
				for _, tool in ipairs(tools_to_install) do
					if not registry.is_installed(tool) then
						local pkg = registry.get_package(tool)
						pkg:install()
					end
				end
			end
		end,
	})
end
