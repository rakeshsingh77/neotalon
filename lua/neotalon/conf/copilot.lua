local M = {}

function M.setup()
	require("copilot").setup({
		suggestion = {
			enabled = true,
			auto_trigger = true,
			debounce = 75,
			keymap = {
				accept = "<C-Enter>",
				next = "<C-Tab>",
				prev = "<C-Shift-Tab>",
				dismiss = "<C-\\>",
			},
		},
		filetypes = {
			["*"] = true,
		},
	})
end
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-Enter>', 'copilot#Accept("")', { expr = true, replace_keycodes = false })

return M
