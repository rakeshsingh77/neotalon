-- Commonly used functions in Neotalon

_G.languages = require("neotalon.vars.languages")

-- Check if a file exists and returns true or false
local function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

-- Executes the setup in the given filename (without the extension)
-- if it exists in the ./conf directory
-- Note that Lazy prefers opts to config
-- Eg.
--   opts = function()
--       run_config("mason")
--   end
_G.run_config = function(filename)
	local conf_file = "neotalon.conf." .. filename
	local conf_path = vim.fn.stdpath("config") .. "/lua/" .. conf_file:gsub("%.", "/") .. ".lua"
	if file_exists(conf_path) then
		local status, conf = pcall(require, conf_file)
		if status then
			if type(conf) == "table" and conf.setup then
				conf.setup()
			end
		end
	end
	-- Also set any corresponding keymaps if available
	set_keymap(filename)
end

-- Sets the keymaps using the which-key definitions in the keymaps directory (if available)
_G.set_keymap = function(filename)
	local keymap_file = "neotalon.keymaps." .. filename
	local keymap_path = vim.fn.stdpath("config") .. "/lua/" .. keymap_file:gsub("%.", "/") .. ".lua"
	if file_exists(keymap_path) then
		require(keymap_file)
	end
end

-- Combine multiple lists into one
function merge_lists(...)
	local merged = {}
	for i = 1, select("#", ...) do
		local list = select(i, ...)
		for _, v in ipairs(list) do
			table.insert(merged, v)
		end
	end
	return merged
end

-- Check if a value exists in a table
function table_contains(table, value)
	for _, v in ipairs(table) do
		if v == value then
			return true
		end
	end
	return false
end

-- Function to combine two tables
function TableConcat(t1, t2)
	for i = 1, #t2 do
		t1[#t1 + 1] = t2[i]
	end
	return t1
end
_G.TableConcat = TableConcat

-- Returns a list of LSP servers that are enabled
function get_lsp_servers()
	local lsp_list = {}
	for lang, config in pairs(languages) do
		if config.lsp and config.lsp.enabled then
			for _, server in ipairs(config.lsp.servers) do
				if config.lsp.mason_alias then
					server = config.lsp.mason_alias
				end
				table.insert(lsp_list, server)
			end
		end
	end
	return lsp_list
end

-- Returns a dictionary of Linters that are enabled (kept for backward compatibility)
function get_linters(only_tools)
	-- Delegate to `get_lang_linters()` which handles `mason_alias` correctly
	return get_lang_linters()
end

-- Returns a dictionary of formatters that are enabled (kept for backward compatibility)
function get_formatters()
	-- Delegate to `get_lang_formatters()` which handles `mason_alias` correctly
	return get_lang_formatters()
end

-- Returns only a list containing linters that are enabled
function get_linter_tools()
	local linter_list = {}
	for lang, config in pairs(languages) do
		if config.linter and config.linter.enabled then
			for _, tool in ipairs(config.linter.tools) do
				if not table_contains(linter_list, tool) then
					table.insert(linter_list, tool)
				end
			end
		end
	end
	return linter_list
end

-- Returns a list of formatters that are enabled
function get_formatter_tools()
	local formatter_list = {}
	for lang, config in pairs(languages) do
		if config.formatter and config.formatter.enabled then
			for _, tool in ipairs(config.formatter.tools) do
				if not table_contains(formatter_list, tool) then
					if config.formatter.mason_alias then
						tool = config.formatter.mason_alias
					end
					table.insert(formatter_list, tool)
				end
			end
		end
	end
	return formatter_list
end

-- Returns a list of all languages with linters enabled
function get_all_languages()
	local lang_list = {}
	for lang, config in pairs(languages) do
		if config.linter and config.linter.enabled then
			table.insert(lang_list, lang)
		end
	end
	return lang_list
end


-- Returns a list of debuggers that are enabled
function get_debugger_tools()
	local debugger_list = {}
	for lang, config in pairs(languages) do
		if config.debugger and config.debugger.enabled then
			for _, tool in ipairs(config.debugger.tools) do
				if not table_contains(debugger_list, tool) then
					table.insert(debugger_list, tool)
				end
			end
		end
	end
	return debugger_list
end

-- Returns a list of debuggers that are enabled for the given language
function get_debuggers(language)
	local debugger_list = {}
	if not language then
		language = vim.bo.filetype
	end
	if languages[language] and languages[language].debugger and languages[language].debugger.enabled then
		if languages[language].debugger.mason_alias then
			debugger_list = { languages[language].debugger.mason_alias }
		else
			debugger_list = languages[language].debugger.tools or {}
		end
	end
	return debugger_list
end

-- Returns a list of formatters that are enabled for the given language
function get_formatters(language)
	local formatter_list = {}
	if not language then
		language = vim.bo.filetype
	end
	if languages[language] and languages[language].formatter and languages[language].formatter.enabled then
		if languages[language].formatter.mason_alias then
			formatter_list = { languages[language].formatter.mason_alias }
		else
			formatter_list = languages[language].formatter.tools or {}
		end
	end
	return formatter_list
end

-- Returns a list of linters that are enabled for the given language
function get_linters(language)
	local linter_list = {}
	if not language then
		language = vim.bo.filetype
	end
	if languages[language] and languages[language].linter and languages[language].linter.enabled then
		if languages[language].linter.mason_alias then
			linter_list = { languages[language].linter.mason_alias }
		else	
			linter_list = languages[language].linter.tools or {}
		end
	end
	return linter_list
end

-- Returns a list of LSP servers that are enabled for the given language
function get_lsps(language)
	local lsp_list = {}
	if not language then
		language = vim.bo.filetype
	end
	if languages[language] and languages[language].lsp and languages[language].lsp.enabled then
		if languages[language].lsp.mason_alias then
			lsp_list = { languages[language].lsp.mason_alias }
		else
			lsp_list = languages[language].lsp.servers or {}
		end
	end
	return lsp_list
end

-- Returns a dictionary of formatters by filetype
function get_lang_formatters()
	local lang_formatters = {}
	for lang, config in pairs(languages) do
		if config.formatter and config.formatter.enabled then
			if config.formatter.mason_alias then
				lang_formatters[lang] = { config.formatter.mason_alias }
			else
				lang_formatters[lang] = config.formatter.tools or {}
			end
		end
	end
	return lang_formatters
end


function get_lang_linters()
	local lang_linters = {}
	for lang, config in pairs(languages) do
		if config.linter and config.linter.enabled then
			if config.linter.mason_alias then
				lang_linters[lang] = { config.linter.mason_alias }
			else
				lang_linters[lang] = config.linter.tools or {}
			end
		end
	end
	return lang_linters
end	


