-- Install nvim-cmp for code completion
-- https://github.com/hrsh7th/nvim-cmp

return {
	{ "neovim/nvim-lspconfig", event = { "InsertEnter", "CmdlineEnter" } },
	{ "hrsh7th/cmp-nvim-lsp", event = { "InsertEnter", "CmdlineEnter" } },
	{ "hrsh7th/cmp-buffer", event = { "InsertEnter", "CmdlineEnter" } },
	{ "hrsh7th/nvim-cmp", event = { "InsertEnter", "CmdlineEnter" } },
	{ "hrsh7th/cmp-path", event = { "InsertEnter", "CmdlineEnter" } },
	{ "hrsh7th/cmp-cmdline", event = { "InsertEnter", "CmdlineEnter" } },
	{ "saadparwaiz1/cmp_luasnip", event = { "InsertEnter", "CmdlineEnter" } },
	{ "L3MON4D3/LuaSnip", event = { "InsertEnter", "CmdlineEnter" } },
	{ "rafamadriz/friendly-snippets", event = { "InsertEnter", "CmdlineEnter" } },
	{
		"hrsh7th/cmp-nvim-lua",
		lazy = false,
		config = function()
			run_config("nvim-cmp")
		end,
	},
}
