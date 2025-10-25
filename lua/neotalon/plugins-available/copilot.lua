-- Install CoPilot for Neovim
-- https://github.com/github/copilot.vim

return {
	"github/copilot.vim",
	lazy = true,
	event = "VeryLazy",
	config = function()
		run_config("copilot")
	end,
}
