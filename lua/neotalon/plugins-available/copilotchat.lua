-- Install the copilotchat plugin to interact with GitHub CoPilot
return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {},
		config = function()
			run_config("copilotchat")
		end,
	},
}
