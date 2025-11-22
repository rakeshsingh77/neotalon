local wk = require("which-key")
-- local Snacks = require("snacks")

-- File Management
wk.add({
	{ "<leader>s", name = "Snacks" },
	{
		"<leader>sb",
		function()
			Snacks.picker.buffers()
		end,
		desc = "Buffers (Ctrl-b)",
	},
	{
		"<leader>sd",
		function()
			Snacks.bufdelete()
		end,
		desc = "Delete Buffer (Ctrl-d)",
	},
	{
		"<leader>se",
		function()
			Snacks.picker.explorer()
		end,
		desc = "Explore Files (Ctrl-e)",
	},
	{
		"<leader>sf",
		function()
			Snacks.picker.smart()
		end,
		desc = "Find Files (Ctrl-f)",
	},
	{
		"<leader>sg",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep Files (Ctrl-g)",
	},
	{
		"<leader>st",
		function()
			Snacks.terminal.toggle()
		end,
		desc = "Terminal",
	},
	{
		"<leader>sz",
		function()
			Snacks.zen()
		end,
		desc = "Zen Mode Toggle",
	},
	{
		"<leader>sD",
		function()
			Snacks.bufdelete.all()
		end,
		desc = "Delete All Buffers (Shift-Ctrl-D)",
	},
	{
		"<leader>sH",
		function()
			Snacks.picker.help()
		end,
		desc = "Help",
	},
	{
		"<leader>s:",
		function()
			Snacks.picker.commands()
		end,
		desc = "Commands",
	},
})

-- Alternative File Management Keymaps
wk.add({
	-- Add a label for g keymaps related to git
	{
		"<c-b>",
		function()
			Snacks.picker.buffers()
		end,
		desc = "Buffers",
	},
	{
		"<c-d>",
		function()
			Snacks.bufdelete()
		end,
		desc = "Delete Buffer",
	},
	{
		"<c-e>",
		function()
			Snacks.picker.explorer()
		end,
		desc = "Explore Files",
	},
	{
		"<c-f>",
		function()
			Snacks.picker.smart()
		end,
		desc = "Find Files",
	},
	{
		"<c-g>",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep Files",
	},
	{
		"<c-D>",
		function()
			Snacks.bufdelete.all()
		end,
		desc = "Delete All Buffers",
	},
})

-- Scratch Pad Keymaps
wk.add({
	{
		"<leader>s.",
		function()
			Snacks.scratch()
		end,
		desc = "Toggle Scratch Buffer",
	},
	{
		"<leader>sS",
		function()
			Snacks.scratch.select()
		end,
		desc = "Select Scratch Buffer",
	},
})

-- Yanky Keymaps
local has_yanky, _ = pcall(require, "yanky")
if has_yanky then
	wk.add({
		{
			"<leader>sy",
			function()
				Snacks.picker.yanky()
			end,
			desc = "Open Yank History",
		},
	})
end
