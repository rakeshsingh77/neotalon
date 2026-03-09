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

wk.add({
    { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Grep Current Selection" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
	{ "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Jump List" },
	{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
	{ "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
	{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
	{ "<leader>fq", "<cmd>Telescope quickfixhistory<cr>", desc = "Quickfix History" },
	{ "<leader>f!", "<cmd>Telescope command_history<cr>", desc = "Command History" },
	{ "<leader>f/", "<cmd>Telescope search_history<cr>", desc = "Search History" },

})
