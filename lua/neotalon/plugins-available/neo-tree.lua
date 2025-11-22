-- Neo-Tree is a file explorer for Neovim written in Lua.
-- It is designed to be fast and efficient, with a focus on performance and usability.
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		lazy = false,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons" }, -- not strictly required, but recommended
			{ "MunifTanjim/nui.nvim" },
			{ "folke/snacks.nvim" },
		},
		opts = {},
		config = function()
			run_config("neo-tree")
		end,
	},
}
