local wk = require("which-key")
local Neogit = require("neogit")

wk.add({
	{ "<leader>g", name = "Git" },
	{ "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Commit" },
	{ "<leader>gd", "<cmd>Neogit diff<cr>", desc = "Diff" },
	{ "<leader>gl", "<cmd>Neogit pull<cr>", desc = "Pull" },
	{ "<leader>gp", "<cmd>Neogit push<cr>", desc = "Push" },
	{ "<leader>gs", "<cmd>Neogit<cr>", desc = "Status" },
})
