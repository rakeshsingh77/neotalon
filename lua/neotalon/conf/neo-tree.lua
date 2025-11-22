local M = {}

function M.setup()
	require("neo-tree").setup({
		close_if_last_window = true,
		enable_git_status = true,
		enable_diagnostics = false,
		sort_case_insensitive = false,
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_hidden = false,
				never_show = { ".DS_Store", "thumbs.db" },
				never_show_by_pattern = { ".git", ".hg", ".svn" },
			},
		},
		default_component_configs = {
			indent = {
				padding = 0,
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "ﰊ",
				default = "*",
				highlight = "NeoTreeFileIcon",
			},
			modified = {
				symbol = "[+]",
				highlight = "NeoTreeModified",
			},
			name = {
				trailing_slash = false,
				use_git_status_colors = true,
				highlight_modified = true,
				highlight = "NeoTreeFileName",
			},
			git_status = {
				symbols = {

				},
			},
		},
	})
end

return M
