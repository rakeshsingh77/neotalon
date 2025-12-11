-- Install mason-nvim-dap to manage Debug Adapter Protocol plugins
-- https://github.com/jay-babu/mason-nvim-dap.nvim

return {
	"jay-babu/mason-nvim-dap.nvim",
	event = { "BufReadPre", "BufNewFile"},
	dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap", "WhoIsSethDaniel/mason-tool-installer" },
	after = { "mason", "mason-tool-installer" },
	opts = function()
		run_config("mason-nvim-dap")
	end,
}
