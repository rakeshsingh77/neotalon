-- Bridge between copilot.vim and nvim-cmp
-- https://github.com/zbirenbaum/copilot-cmp

return {
	"zbirenbaum/copilot-cmp",
	dependencies = {
		"zbirenbaum/copilot.lua",
	},
	config = function()
		require("copilot_cmp").setup()
	end,
}
