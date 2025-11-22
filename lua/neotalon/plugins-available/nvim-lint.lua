-- Install nvim-lint for linting support
-- https://github.com/mfussenegger/nvim-lint

return {
	"mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile", "InsertEnter" },
	config = function()
		run_config("nvim-lint")
	end,
}

