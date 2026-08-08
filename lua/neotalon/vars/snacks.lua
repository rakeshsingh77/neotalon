-- Snacks Modules

SNACK_PLUGINS = {
	animate = { enabled = true },
	bigfile = { enabled = true },
	bufdelete = { enabled = true },
	dashboard = {
		enabled = true,
		preset = {
			header = BANNER_TEXT,
		},
	},
	debug = { enabled = false },
	dim = { enabled = false },
	explorer = {
		enabled = false,
		replace_netrw = false
	},
    gh = { enabled = false },
	git = { enabled = true },
	gitbrowse = { enabled = true },
	image = { enabled = true },
	indent = {
		enabled = true,
		priority = 1,
		char = "│",
		scope = {
			enabled = true,
		},
		chunk = {
			enabled = true,
		}
	},
	input = { enabled = true },
	layout = { enabled = false },
	lazygit = { enabled = true },
	notifier = { enabled = true, timeout = 3000 },
	notify = { enabled = false },
	picker = { enabled = true },
	profiler = { enabled = true },
	quickfile = { enabled = true },
	rename = { enabled = false },
	scope = { enabled = false },
	scratch = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = false },
	terminal = { enabled = true },
	toggle = { enabled = true },
	util = { enabled = false },
	win = { enabled = false },
	words = { enabled = true },
	zen = { enabled = true },
}
