local M = {}

function M.setup()
	require("noice").setup({
		lsp = {
			progress = {
				enabled = true,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
		},
		presets = {
			bottom_search = false,
			command_palette = false,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = true,
		},
		notify = {
			enabled = true,
			view = "notify",
		},
		commands = {
			history = {
				enabled = true,
			},
		},
	})
end

return M
