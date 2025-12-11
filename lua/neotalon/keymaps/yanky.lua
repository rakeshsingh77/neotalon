-- Require yanky plugin
local yanky = require("yanky")
local wk = require("which-key")

vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")

vim.keymap.set("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
vim.keymap.set("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
vim.keymap.set("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
vim.keymap.set("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")

vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)")
vim.keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)")

wk.add({
	{ "<leader>y", name = "Yanky" },
	{ "<leader>yc", "<cmd>Telescope grep_string<cr>", desc = "Grep Current Selection" },
	{ "<leader>yb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	{ "<leader>yf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>yg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
	{ "<leader>yh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
	{ "<leader>yj", "<cmd>Telescope jumplist<cr>", desc = "Jump List" },
	{ "<leader>yk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
	{ "<leader>ym", "<cmd>Telescope marks<cr>", desc = "Marks" },
	{ "<leader>yo", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
	{ "<leader>yq", "<cmd>Telescope quickfixhistory<cr>", desc = "Quickfix History" },
	{ "<leader>y!", "<cmd>Telescope command_history<cr>", desc = "Command History" },
	{ "<leader>y/", "<cmd>Telescope search_history<cr>", desc = "Search History" },
})
