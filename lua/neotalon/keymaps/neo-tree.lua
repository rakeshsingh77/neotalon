local wk = require("which-key")

wk.add({
	{ "<leader>n", name = "NeoTree" },
	{ "<leader>ne", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
	{ "<leader>nf", "<cmd>Neotree float<cr>", desc = "Float" },
	{ "<leader>ns", "<cmd>Neotree focus<cr>", desc = "Focus" },
	{ "<leader>nr", "<cmd>Neotree reveal<cr>", desc = "Reveal" },
})

vim.api.nvim_set_keymap("n", ":Ex", ":Neotree toggle<CR>", { noremap = true, silent = true })

