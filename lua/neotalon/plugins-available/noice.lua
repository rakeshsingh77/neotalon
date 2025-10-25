-- This plugin is used to enhance the user experience by providing a better
-- UI for messages, notifications, and other events in Neovim.
-- https://github.com/folke/noice.nvim

return {
	{ "MunifTanjim/nui.nvim" },
	{ "rcarriga/nvim-notify" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = function()
			run_config("noice")
		end,
	},
}
