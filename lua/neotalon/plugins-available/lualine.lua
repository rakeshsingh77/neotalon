-- Fast, easy on the eye status line for Neovim
-- https://github.com/nvim-lualine/lualine.nvim

return {
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		event = { "VeryLazy" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			run_config("lualine")
		end,
	},
}
