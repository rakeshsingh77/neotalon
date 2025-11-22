local wk = require("which-key")
local harpoon = require("harpoon")


wk.add({
	{ "<leader>h", name = "Harpoon" },
	{
		"<leader>ha",
		function()
			harpoon:list():add()
			vim.notify("File added to Harpoon")
		end,
		desc = "Add File",
	},
	{
		"<leader>hl",
		function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		desc = "List",
	},
	{
		"<leader>hn",
		function()
			harpoon:list():next()
		end,
		desc = "Next File",
	},
	{
		"<leader>hp",
		function()
			harpoon:list():prev()
		end,
		desc = "Previous File",
	},
	{
		"<leader>h1",
		function()
			harpoon:list():select(1)
			vim.notify("Switched to File 1: " .. vim.api.nvim_buf_get_name(0))
		end,
		desc = "File 1",
	},
	{
		"<leader>h2",
		function()
			harpoon:list():select(2)
			vim.notify("Switched to File 2: " .. vim.api.nvim_buf_get_name(0))
		end,
		desc = "File 2",
	},
	{
		"<leader>h3",
		function()
			harpoon:list():select(3)
			vim.notify("Switched to File 3: " .. vim.api.nvim_buf_get_name(0))
		end,
		desc = "File 3",
	},
	{
		"<leader>h4",
		function()
			harpoon:list():select(4)
			vim.notify("Switched to File 4: " .. vim.api.nvim_buf_get_name(0))
		end,
		desc = "File 4",
	},
	{
		"<leader>h5",
		function()
			harpoon:list():select(5)
			vim.notify("Switched to File 5: " .. vim.api.nvim_buf_get_name(0))
		end,
		desc = "File 5",
	},
})
