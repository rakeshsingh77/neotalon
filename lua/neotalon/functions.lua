-- Commonly used functions in Neotalon
-- @module neotalon.functions

---@class NeotalonFunctions
local M = {}

local languages = require("neotalon.vars.languages")
local constants = require("neotalon.vars.constants")

--- Check if a file exists
---@param path string The file path to check
---@return boolean True if file exists, false otherwise
local function file_exists(path)
	-- Prefer Neovim's libuv wrapper for robust filesystem checks
	local stat = vim.loop.fs_stat(path)
	return stat ~= nil
end

--- Executes the setup in the given filename (without the extension)
--- if it exists in the ./conf directory
--- Note that Lazy prefers opts to config
---@example
---   opts = function()
---       run_config("mason")
---   end
---@param filename string The module name without extension
_G.run_config = function(filename)
	if not filename or type(filename) ~= "string" then
		vim.notify("run_config: invalid filename parameter", vim.log.levels.ERROR)
		return
	end

	local conf_file = constants.CONF_PREFIX .. "." .. filename
	local conf_path = vim.fn.stdpath("config") .. "/lua/" .. conf_file:gsub("%.", "/") .. ".lua"
	
	if file_exists(conf_path) then
		local status, conf = pcall(require, conf_file)
		if status then
			if type(conf) == "table" and conf.setup then
				conf.setup()
			end
		else
			vim.notify(
				"run_config: failed to load config for '" .. filename .. "': " .. tostring(conf),
				vim.log.levels.WARN
			)
		end
	end
	
	-- Also set any corresponding keymaps if available
	_G.set_keymap(filename)
end

--- Sets the keymaps using the which-key definitions in the keymaps directory (if available)
---@param filename string The module name without extension
_G.set_keymap = function(filename)
	if not filename or type(filename) ~= "string" then
		vim.notify("set_keymap: invalid filename parameter", vim.log.levels.ERROR)
		return
	end

	local keymap_file = constants.KEYMAPS_PREFIX .. "." .. filename
	local keymap_path = vim.fn.stdpath("config") .. "/lua/" .. keymap_file:gsub("%.", "/") .. ".lua"
	
	if file_exists(keymap_path) then
		local status, err = pcall(require, keymap_file)
		if not status then
			vim.notify(
				"set_keymap: failed to load keymaps for '" .. filename .. "': " .. tostring(err),
				vim.log.levels.WARN
			)
		end
	end
end

--- Combine multiple lists into one
---@param ... table[] Variable number of tables to merge
---@return table Merged table containing all elements
function M.merge_lists(...)
	local merged = {}
	for i = 1, select("#", ...) do
		local list = select(i, ...)
		if type(list) == "table" then
			for _, v in ipairs(list) do
				table.insert(merged, v)
			end
		end
	end
	return merged
end

-- Expose globally for backward compatibility
_G.merge_lists = M.merge_lists

--- Check if a value exists in a table
---@param tbl table The table to search
---@param value any The value to find
---@return boolean True if value exists in table, false otherwise
function M.table_contains(tbl, value)
	if not tbl or type(tbl) ~= "table" then
		return false
	end
	for _, v in ipairs(tbl) do
		if v == value then
			return true
		end
	end
	return false
end

-- Expose globally for backward compatibility
_G.table_contains = M.table_contains

--- Generic factory function to get tools of a specific type for a given language
---@param tool_type string 
---@param language string|nil 
---@return table List 
local function get_tools_for_language(tool_type, language)
	if not language then
		language = vim.bo.filetype
	end
	
	local tools_list = {}
	if languages[language] and languages[language][tool_type] then
		local lang_config = languages[language][tool_type]
		if lang_config.enabled then
			if lang_config.mason_alias then
				tools_list = { lang_config.mason_alias }
			else
				local key = (tool_type == "lsp") and "servers" or "tools"
				tools_list = lang_config[key] or {}
			end
		end
	end
	return tools_list
end

--- Generic factory function to get all tools of a specific type across all languages
---@param tool_type string The type of tool (lsp, linter, formatter, debugger)
---@return table List of all unique tools of that type
local function get_all_tools_of_type(tool_type)
	local tools_list = {}
	for lang, config in pairs(languages) do
		if config[tool_type] and config[tool_type].enabled then
			local key = (tool_type == "lsp") and "servers" or "tools"
			for _, tool in ipairs(config[tool_type][key] or {}) do
				if not M.table_contains(tools_list, tool) then
					if config[tool_type].mason_alias then
						tool = config[tool_type].mason_alias
					end
					table.insert(tools_list, tool)
				end
			end
		end
	end
	return tools_list
end

--- Generic factory function to get tools by language
---@param tool_type string The type of tool (lsp, linter, formatter, debugger)
---@return table Dictionary mapping language -> tools list
local function get_tools_by_language(tool_type)
	local lang_tools = {}
	for lang, config in pairs(languages) do
		if config[tool_type] and config[tool_type].enabled then
			if config[tool_type].mason_alias then
				lang_tools[lang] = { config[tool_type].mason_alias }
			else
				local key = (tool_type == "lsp") and "servers" or "tools"
				lang_tools[lang] = config[tool_type][key] or {}
			end
		end
	end
	return lang_tools
end

-- ============================================================================
-- Public API Functions (with backward compatibility)
-- ============================================================================

--- Returns a list of LSP servers that are enabled
---@return table List of all LSP servers across all languages
function M.get_lsp_servers()
	return get_all_tools_of_type("lsp")
end
_G.get_lsp_servers = M.get_lsp_servers

--- Returns a list of linters that are enabled
---@return table List of all linters across all languages
function M.get_linter_tools()
	return get_all_tools_of_type("linter")
end
_G.get_linter_tools = M.get_linter_tools

--- Returns a list of formatters that are enabled
---@return table List of all formatters across all languages
function M.get_formatter_tools()
	return get_all_tools_of_type("formatter")
end
_G.get_formatter_tools = M.get_formatter_tools

--- Returns a list of debuggers that are enabled
---@return table List of all debuggers across all languages
function M.get_debugger_tools()
	return get_all_tools_of_type("debugger")
end
_G.get_debugger_tools = M.get_debugger_tools

--- Returns a list of all languages with linters enabled
---@return table List of languages with linters
function M.get_all_languages()
	local lang_list = {}
	for lang, config in pairs(languages) do
		if config.linter and config.linter.enabled then
			table.insert(lang_list, lang)
		end
	end
	return lang_list
end
_G.get_all_languages = M.get_all_languages

--- Returns LSP servers for a language
---@param language string|nil Language name (uses current filetype if not provided)
---@return table List of LSP servers
function M.get_lsps(language)
	return get_tools_for_language("lsp", language)
end
_G.get_lsps = M.get_lsps

--- Returns linters for a language
---@param language string|nil Language name (uses language->tools dict if not provided)
---@return table List of linters or language->tools mapping
function M.get_linters(language)
	if not language then
		return get_tools_by_language("linter")
	end
	return get_tools_for_language("linter", language)
end
_G.get_linters = M.get_linters

--- Returns formatters for a language
---@param language string|nil Language name (uses language->tools dict if not provided)
---@return table List of formatters or language->tools mapping
function M.get_formatters(language)
	if not language then
		return get_tools_by_language("formatter")
	end
	return get_tools_for_language("formatter", language)
end
_G.get_formatters = M.get_formatters

--- Returns debuggers for a language
---@param language string|nil Language name (uses current filetype if not provided)
---@return table List of debuggers
function M.get_debuggers(language)
	return get_tools_for_language("debugger", language)
end
_G.get_debuggers = M.get_debuggers

--- Returns a dictionary of formatters by filetype
---@return table Language -> formatters mapping
function M.get_lang_formatters()
	return get_tools_by_language("formatter")
end
_G.get_lang_formatters = M.get_lang_formatters

--- Returns a dictionary of linters by filetype
---@return table Language -> linters mapping
function M.get_lang_linters()
	return get_tools_by_language("linter")
end
_G.get_lang_linters = M.get_lang_linters

return M

