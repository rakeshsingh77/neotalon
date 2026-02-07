-- Require yanky plugin
local yanky = require("yanky")
local wk = require("which-key")

wk.add({
	{ "<leader>y", name = "Yanky" },
	{ "<leader>y]p", "<cmd>normal! ]p<cr>", desc = "Put Indent After (linewise)" },
	{ "<leader>y[p", "<cmd>normal! [p<cr>", desc = "Put Indent Before (linewise)" },
	{ "<leader>y]P", "<cmd>normal! ]P<cr>", desc = "Put Indent After (linewise, before)" },
	{ "<leader>y[P", "<cmd>normal! [P<cr>", desc = "Put Indent Before (linewise, before)" },
	{ "<leader>y>p", "<cmd>normal! >p<cr>", desc = "Put Indent After (shift right)" },
	{ "<leader>y<p", "<cmd>normal! <p<cr>", desc = "Put Indent After (shift left)" },
	{ "<leader>y>P", "<cmd>normal! >P<cr>", desc = "Put Indent Before (shift right)" },
	{ "<leader>y<P", "<cmd>normal! <P<cr>", desc = "Put Indent Before (shift left)" },
	{ "<leader>y=p", "<cmd>normal! =p<cr>", desc = "Put After Filter" },
	{ "<leader>y=P", "<cmd>normal! =P<cr>", desc = "Put Before Filter" },
})
