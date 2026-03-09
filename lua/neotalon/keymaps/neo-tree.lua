local wk = require("which-key")

wk.add({
	{ "<leader>n", name = "NeoTree" },
	{ "<leader>ne", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
	{ "<leader>nf", "<cmd>Neotree float<cr>", desc = "Float" },
	{ "<leader>ns", "<cmd>Neotree focus<cr>", desc = "Focus" },
	{ "<leader>nr", "<cmd>Neotree reveal<cr>", desc = "Reveal" },
    { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "Neotree File Explorer" },
})


