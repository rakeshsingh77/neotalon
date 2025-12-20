local M = {}

function M.setup()
	local wk = require("which-key")
	-- Neovim Top-level Keymaps
	wk.add({
		{ "<leader>n", "<cmd>n<cr>", desc = "New" },
		{ "<leader>w", "<cmd>w<cr>", desc = "Save" },
		{ "<leader>W", "<cmd>w!<cr>", desc = "Force Save" },
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit" },
		{ "<leader>Q", "<cmd>q!<cr>", desc = "Quit without saving" },
		{ "<leader>x", "<cmd>x<cr>", desc = "Save and Quit" },
		{ "<leader>C", "<cmd>checkhealth<cr>", desc = "Check Health" },
		{ "<leader>H", "<cmd>help<cr>", desc = "Help" },
		{ "<leader>L", "<cmd>Lazy<cr>", desc = "Lazy" },
	})
end

return M
