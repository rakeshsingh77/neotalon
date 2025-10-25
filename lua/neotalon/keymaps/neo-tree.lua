local wk = require("which-key")

wk.add({
	{ "<c-n>", name = "NeoTree" },
	{ "<c-n>e", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
	{ "<c-n>f", "<cmd>Neotree float<cr>", desc = "Float" },
	{ "<c-n>w", "<cmd>Neotree focus<cr>", desc = "Focus" },
	{ "<c-n>r", "<cmd>Neotree reveal<cr>", desc = "Reveal" },
})
