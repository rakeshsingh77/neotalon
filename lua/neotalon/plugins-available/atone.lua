-- Install the atone plugin for undotree visualization
-- https://github.com/XXiaoA/atone.nvim

return {
    "XXiaoA/atone.nvim",
	event = "BufEnter",
	opts = function()
		run_config("atone")
	end,
}
