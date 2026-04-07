local wk = require("which-key")

wk.add({ "<leader>s", name = "Snacks" })

local function safe_require_snacks()
	local ok, Snacks = pcall(require, "snacks")
	return ok and Snacks
end

wk.add({
	{ "<leader>s", name = "Snacks" },
	{
		"<leader>sb",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.picker.buffers() end
		end,
		desc = "Buffers",
	},
	{
		"<leader>sd",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.bufdelete() end
		end,
		desc = "Delete Buffer",
	},
	{
		"<leader>se",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.picker.explorer() end
		end,
		desc = "Explore Files",
	},
	{
		"<leader>sf",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.picker.smart() end
		end,
		desc = "Find Files",
	},
	{
		"<leader>sg",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.picker.grep() end
		end,
		desc = "Grep Files",
	},
	{
		"<leader>st",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.terminal.toggle() end
		end,
		desc = "Terminal",
	},
	{
		"<leader>sz",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.zen() end
		end,
		desc = "Zen Mode",
	},
	{
		"<leader>sD",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.bufdelete.all() end
		end,
		desc = "Delete All Buffers",
	},
	{
		"<leader>sH",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.picker.help() end
		end,
		desc = "Help",
	},
	{
		"<leader>s:",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.picker.commands() end
		end,
		desc = "Commands",
	},
	{
		"<leader>s.",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.scratch() end
		end,
		desc = "Scratch Buffer",
	},
	{
		"<leader>sS",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.scratch.select() end
		end,
		desc = "Select Scratch",
	},
})

wk.add({
	{ "<leader>g", name = "Git" },
	{
		"<leader>gs",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.picker.git_status() end
		end,
		desc = "Git Status",
	},
	{
		"<leader>gl",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.picker.git_log() end
		end,
		desc = "Git Log",
	},
	{
		"<leader>gL",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.picker.git_log_current_file() end
		end,
		desc = "Git Log (Current File)",
	},
	{
		"<leader>gb",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.git.blame() end
		end,
		desc = "Git Blame",
	},
	{
		"<leader>gv",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.gitbrowse() end
		end,
		desc = "Git Browse",
	},
	{
		"<leader>glg",
		function()
			local Snacks = safe_require_snacks()
			if Snacks and Snacks.lazygit then Snacks.lazygit() end
		end,
		desc = "LazyGit",
	},
})

wk.add({
	{
		"<leader>stn",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.toggle.notifier() end
		end,
		desc = "Toggle Notifier",
	},
	{
		"<leader>std",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.toggle.dim() end
		end,
		desc = "Toggle Dim",
	},
	{
		"<leader>sti",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.toggle.indentation() end
		end,
		desc = "Toggle Indentation",
	},
	{
		"<leader>stw",
		function()
			local Snacks = safe_require_snacks()
			if Snacks then Snacks.toggle.word_wrap() end
		end,
		desc = "Toggle Word Wrap",
	},
})

local has_yanky, _ = pcall(require, "yanky")
if has_yanky then
	wk.add({
		{
			"<leader>sy",
			function()
				local Snacks = safe_require_snacks()
				if Snacks then Snacks.picker.yanky() end
			end,
			desc = "Yank History",
		},
	})
end


