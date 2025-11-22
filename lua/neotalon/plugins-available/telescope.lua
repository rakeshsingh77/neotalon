-- Install the telescope plugin to search, filter, preview and select files
-- using a fuzzy finder.
-- https://github.com/nvim-telescope/telescope.nvim

return {
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{ "echasnovski/mini.nvim", version = "*" },
	{
		"nvim-telescope/telescope.nvim",
		event = { "BufReadPost", "BufNewFile", "VeryLazy" },
		opts = function()
			run_config("telescope")
		end,
	},
}
