-- Install the CodeRunner plugin to execute code or compile
-- from source
-- https://github.com/CRAG666/code_runner.nvim
return {
	"CRAG666/code_runner.nvim",
	event = "VeryLazy",
	dependencies = {
		"akinsho/toggleterm.nvim",
	},
	config = function()
		run_config("code-runner")
	end,
}
