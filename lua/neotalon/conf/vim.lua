-- Configure vim settings
-- Type annotations for global variables from vars/
---@type boolean
EXPANDTAB = EXPANDTAB or false
---@type number
TABSTOP = TABSTOP or 4
---@type number
SHIFTWIDTH = SHIFTWIDTH or 4
---@type boolean
AUTOINDENT = AUTOINDENT or false
---@type number
COLORCOLUMN = COLORCOLUMN or 80
---@type boolean
CURSORLINE = CURSORLINE or false
---@type string
CURSORLINEOPT = CURSORLINEOPT or "number"
---@type boolean
RELATIVENUMBERS = RELATIVENUMBERS or false
---@type boolean
NUMBER = NUMBER or false
---@type string
MOUSE = MOUSE or ""
---@type boolean
SIGNCOLUMN = SIGNCOLUMN or false
---@type boolean
WRAP = WRAP or false
---@type boolean
SWAPFILE = SWAPFILE or false
---@type string
FOLDMETHOD = FOLDMETHOD or "indent"
---@type boolean
FOLDENABLE = FOLDENABLE or false
---@type number
FOLDLEVEL = FOLDLEVEL or 99

-- Set up the Neovim options based on the values in the vars.lua file
vim.opt.expandtab = EXPANDTAB
vim.opt.tabstop = TABSTOP
vim.opt.shiftwidth = SHIFTWIDTH
vim.opt.autoindent = AUTOINDENT
vim.opt.colorcolumn = string.format("%d", COLORCOLUMN)
vim.opt.cursorline = CURSORLINE
vim.opt.cursorlineopt = CURSORLINEOPT
vim.opt.relativenumber = RELATIVENUMBERS
vim.opt.number = NUMBER
vim.opt.mouse = MOUSE
vim.opt.signcolumn = SIGNCOLUMN and "yes" or "no"
vim.opt.wrap = WRAP
vim.opt.swapfile = SWAPFILE
vim.opt.clipboard = "unnamedplus"
vim.opt.foldmethod = FOLDMETHOD
vim.opt.foldenable = FOLDENABLE
vim.opt.foldlevel = FOLDLEVEL

vim.g.health_icons = {
  ok = "✓",
  error = "✗",
  warning = "⚠",
  info = "ℹ",
}

-- Better diagnostic signs in the sign column (requires a nerd font / patched font)
local sign_list = { Error = " ", Warn = " ", Hint = " ", Info = " " }

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = sign_list.Error,
			[vim.diagnostic.severity.WARN] = sign_list.Warn,
			[vim.diagnostic.severity.INFO] = sign_list.Info,
			[vim.diagnostic.severity.HINT] = sign_list.Hint,
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = { show_header = true, source = "always", border = "rounded" },
})

-- Show diagnostics in a floating window on CursorHold (hover)
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})

-- Keymap to manually open diagnostic float
vim.keymap.set("n", "dm", vim.diagnostic.open_float, { silent = true })

-- Remember cursor position
if REMEMBER_CURSORPOS then
	vim.api.nvim_create_autocmd("BufReadPost", {
		callback = function()
			local mark = vim.api.nvim_buf_get_mark(0, '"')
			local line_count = vim.api.nvim_buf_line_count(0)
			if mark[1] > 0 and mark[1] <= line_count then
				vim.api.nvim_win_set_cursor(0, { mark[1], mark[2] })
			end
		end,
	})
end
