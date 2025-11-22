local wk = require("which-key")

wk.add({
	{
		"<leader>r",
		name = "Code Runner",
	},
	{
		"<leader>rc",
		"<cmd>RunCode<CR>",
		desc = "Run Code",
	},
	{
		"<leader>rf",
		"<cmd>RunFile<CR>",
		desc = "Run File",
	},
	{
		"<leader>rp",
		"<cmd>RunProject<CR>",
		desc = "Run Project",
	},
})
