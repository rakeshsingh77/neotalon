#!/usr/bin/env -S nvim -l
-- Validation script for Neotalon language configuration
-- Usage: nvim -l lua/neotalon/tests/validate_languages.lua
-- This script checks that all language configurations are valid

local languages = require("neotalon.vars.languages")

local VALID_TOOL_TYPES = { "lsp", "linter", "formatter", "debugger" }
local required_keys = { "lsp", "linter", "formatter", "debugger" }

--- Validate that a tool type configuration is correct
---@param tool_type string 
---@param config table 
---@param lang string 
---@return boolean True 
---@return string Error 
local function validate_tool_config(tool_type, config, lang)
	if not config then
		return false, "Missing configuration for " .. tool_type
	end

	if type(config) ~= "table" then
		return false, tool_type .. " config must be a table, got " .. type(config)
	end

	if config.enabled ~= nil and type(config.enabled) ~= "boolean" then
		return false, tool_type .. ".enabled must be boolean"
	end

	local key = (tool_type == "lsp") and "servers" or "tools"
	if config.enabled and config[key] ~= nil then
		if type(config[key]) ~= "table" then
			return false, tool_type .. "." .. key .. " must be a table"
		end
		if #config[key] == 0 and not config.mason_alias then
			return false, tool_type .. "." .. key .. " is empty and no mason_alias provided"
		end
	end

	if config.mason_alias ~= nil and type(config.mason_alias) ~= "string" then
		return false, tool_type .. ".mason_alias must be string"
	end

	return true
end

--- Validate a single language configuration
---@param lang string 
---@param config table
---@return boolean True
---@return table Table 
local function validate_language(lang, config)
	local errors = {}

	if type(config) ~= "table" then
		table.insert(errors, "Language config must be a table, got " .. type(config))
		return false, errors
	end

	-- Check all required tool types are present
	for _, tool_type in ipairs(required_keys) do
		local ok, err = validate_tool_config(tool_type, config[tool_type], lang)
		if not ok then
			table.insert(errors, tool_type .. ": " .. err)
		end
	end

	return #errors == 0, errors
end

--- Main validation routine
local function main()
	print("Validating Neotalon language configuration...\n")

	local total_langs = 0
	local valid_langs = 0
	local invalid_langs = {}

	for lang, config in pairs(languages) do
		total_langs = total_langs + 1
		local ok, errors = validate_language(lang, config)

		if ok then
			valid_langs = valid_langs + 1
			print("✓ " .. lang)
		else
			table.insert(invalid_langs, { lang = lang, errors = errors })
			print("✗ " .. lang)
			for _, err in ipairs(errors) do
				print("  - " .. err)
			end
		end
	end

	print("\n" .. string.rep("=", 60))
	print("Validation Results:")
	print("  Total languages: " .. total_langs)
	print("  Valid: " .. valid_langs)
	print("  Invalid: " .. #invalid_langs)
	print(string.rep("=", 60))

	if #invalid_langs > 0 then
		print("\n❌ Validation FAILED")
		return false
	else
		print("\n✅ Validation PASSED")
		return true
	end
end

-- Run validation
local success = main()
os.exit(success and 0 or 1)
