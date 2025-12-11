local M = {}

function M.setup()
	require("copilot").setup({
		suggestion = {
			enabled = true,
			auto_trigger = true,
			debounce = 75,
			keymap = {
				accept = "<C-Tab">,
				accept_word = "<A-w>",
				accept_line = "<C-Down>",
				next = "<C-l>",
				prev = "<C-k>",
				dismiss = "<C-\\>",
			},
		},
		filetypes = {
			["*"] = true,
		},
	})
end

return M
