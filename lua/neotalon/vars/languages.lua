-- Language-specific configuration table (alphabetical, major Neovim LSP support)
-- This module returns a table of language configs for use elsewhere.
-- Usage: local languages = require("neotalon.vars.languages")

local languages = {
	c = {
		lsp = { enabled = true, servers = { "clangd" } },
		linter = { enabled = true, tools = { "cpplint" } },
		formatter = { enabled = true, tools = { "clang-format" } },
		debugger = { enabled = true, tools = { "cpptools" } },
	},
	cpp = {
		lsp = { enabled = false, servers = { "clangd" } },
		linter = { enabled = false, tools = {} },
		formatter = { enabled = false, tools = { "clang-format" } },
		debugger = { enabled = false, tools = { "cpptools" } },
	},
	css = {
		lsp = { enabled = false, servers = { "cssls" } },
		linter = { enabled = false, tools = {} },
		formatter = { enabled = false, tools = { "prettier" } },
		debugger = { enabled = false, tools = {} },
	},
	dockerfile = {
		lsp = { enabled = true, servers = { "dockerls" } },
		linter = { enabled = false, tools = {} },
		formatter = { enabled = true, tools = { "prettier" } },
		debugger = { enabled = false, tools = {} },
	},
	go = {
		lsp = { enabled = false, servers = { "gopls" } },
		linter = { enabled = false, tools = {} },
		formatter = { enabled = false, tools = { "gofumpt" } },
		debugger = { enabled = false, tools = { "delve" } },
	},
	html = {
		lsp = { enabled = true, servers = { "html" } },
		linter = { enabled = true, tools = { "htmlhint" } },
		formatter = { enabled = true, tools = { "prettier" } },
		debugger = { enabled = false, tools = {} },
	},
	java = {
		lsp = { enabled = false, servers = { "jdtls" } },
		linter = { enabled = false, tools = {} },
		formatter = { enabled = false, tools = { "google-java-format" } },
		debugger = { enabled = false, tools = { "java-debug-adapter" } },
	},
	javascript = {
		lsp = { enabled = false, servers = { "tsserver" }, mason_alias = "typescript-language-server" },
		linter = { enabled = false, tools = { "eslint" } },
		formatter = { enabled = false, tools = { "prettier" } },
		debugger = { enabled = false, tools = { "js-debug-adapter" } },
	},
	json = {
		lsp = { enabled = true, servers = { "json-lsp" } },
		linter = { enabled = true, tools = { "jsonlint" } },
		formatter = { enabled = true, tools = { "prettier" } },
		debugger = { enabled = false, tools = {} },
	},
	lua = {
		lsp = { enabled = true, servers = { "lua-language-server" } },
		linter = { enabled = true, tools = {} },
		formatter = { enabled = true, tools = { "stylua" } },
		debugger = { enabled = false, tools = {} },
	},
	markdown = {
		lsp = { enabled = true, servers = { "marksman" } },
		linter = { enabled = true, tools = { "markdownlint" } },
		formatter = { enabled = true, tools = { "prettier" } },
		debugger = { enabled = false, tools = {} },
	},
	perl = {
		lsp = { enabled = false, servers = { "perlnavigator" } },
		linter = { enabled = false, tools = {} },
		formatter = { enabled = false, tools = {} },
		debugger = { enabled = false, tools = { "perl-debug-adapter" } },
	},
	php = {
		lsp = { enabled = false, servers = { "intelephense" } },
		linter = { enabled = false, tools = { "phpcs" } },
		formatter = { enabled = false, tools = { "php-cs-fixer" } },
		debugger = { enabled = false, tools = { "php-debug-adapter" } },
	},
	python = {
		lsp = { enabled = true, servers = { "pyright" } },
		linter = { enabled = true, tools = { "ruff", "mypy" } },
		formatter = { enabled = true, tools = { "autopep8", "isort" } },
		debugger = { enabled = true, tools = { "debugpy" } },
	},
	ruby = {
		lsp = { enabled = false, servers = { "solargraph" } },
		linter = { enabled = false, tools = { "rubocop" } },
		formatter = { enabled = false, tools = { "rubocop" } },
		debugger = { enabled = false, tools = {} },
	},
	rust = {
		lsp = { enabled = false, servers = { "rust_analyzer" } },
		linter = { enabled = false, tools = {} },
		formatter = { enabled = false, tools = { "rustfmt" } },
		debugger = { enabled = false, tools = { "cpptools" } },
	},
	sh = {
		lsp = { enabled = true, servers = { "bash-language-server" } },
		linter = { enabled = true, tools = { "shellcheck" } },
		formatter = { enabled = true, tools = { "shfmt" } },
		debugger = { enabled = false, tools = { "bash-debug-adapter" } },
	},
	sql = {
		lsp = { enabled = true, servers = { "sqlls" } },
		linter = { enabled = true, tools = { "sqlfluff" } },
		formatter = { enabled = true, tools = { "sql_formatter" }, mason_alias = "sql-formatter" },
		debugger = { enabled = false, tools = {} },
	},
	typescript = {
		lsp = { enabled = false, servers = { "tsserver" }, mason_alias = "typescript-language-server" },
		linter = { enabled = false, tools = { "eslint" } },
		formatter = { enabled = false, tools = { "prettier" } },
		debugger = { enabled = false, tools = { "js-debug-adapter" } },
	},
	vim = {
		lsp = { enabled = false, servers = { "vimls" } },
		linter = { enabled = false, tools = {} },
		formatter = { enabled = false, tools = {} },
		debugger = { enabled = false, tools = {} },
	},
	yaml = {
		lsp = { enabled = true, servers = { "yamlls" } },
		linter = { enabled = true, tools = { "yamllint" } },
		formatter = { enabled = true, tools = { "prettier" } },
		debugger = { enabled = false, tools = {} },
	},
	zsh = {
		lsp = { enabled = true, servers = { "bash-language-server" } },
		linter = { enabled = true, tools = { "shellcheck" } },
		formatter = { enabled = true, tools = { "shfmt" } },
		debugger = { enabled = false, tools = { "bash-debug-adapter" } },
	},
}

return languages
