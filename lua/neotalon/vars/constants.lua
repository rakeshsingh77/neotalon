-- Constants and magic strings used throughout Neotalon
-- Centralized to avoid duplication and make changes easier

return {
	-- Configuration directory/prefix
	CONF_PREFIX = "neotalon.conf",
	CONF_DIR_NAME = "conf",

	-- Keymaps directory/prefix
	KEYMAPS_PREFIX = "neotalon.keymaps",
	KEYMAPS_DIR_NAME = "keymaps",

	-- Plugins directory/prefix
	PLUGINS_ENABLED_PREFIX = "neotalon.plugins-enabled",
	PLUGINS_AVAILABLE_PREFIX = "neotalon.plugins-available",
	PLUGINS_DIR_NAME = "plugins",

	-- Variables directory/prefix
	VARS_PREFIX = "neotalon.vars",
	VARS_DIR_NAME = "vars",

	-- Tool types for language configuration
	TOOL_TYPES = {
		LSP = "lsp",
		LINTER = "linter",
		FORMATTER = "formatter",
		DEBUGGER = "debugger",
	},

	-- Configuration keys
	CONFIG_KEYS = {
		ENABLED = "enabled",
		SERVERS = "servers",
		TOOLS = "tools",
		MASON_ALIAS = "mason_alias",
	},
}
