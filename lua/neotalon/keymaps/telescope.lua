local wk = require("which-key")
local Telescope = require("telescope")

wk.add({
	{ "<leader>t", name = "Telescope" },
	{ "<leader>tc", "<cmd>Telescope grep_string<cr>", desc = "Grep Current Selection" },
	{ "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	{ "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
	{ "<leader>th", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
	{ "<leader>tj", "<cmd>Telescope jumplist<cr>", desc = "Jump List" },
	{ "<leader>tk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
	{ "<leader>tm", "<cmd>Telescope marks<cr>", desc = "Marks" },
	{ "<leader>to", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
	{ "<leader>tq", "<cmd>Telescope quickfixhistory<cr>", desc = "Quickfix History" },
	{ "<leader>t!", "<cmd>Telescope command_history<cr>", desc = "Command History" },
	{ "<leader>t/", "<cmd>Telescope search_history<cr>", desc = "Search History" },
})
