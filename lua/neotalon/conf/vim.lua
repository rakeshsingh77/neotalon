-- Configure vim settings

-- Set up the Neovim options based on the values in the vars.lua file
vim.opt.expandtab = EXPANDTAB or false
vim.opt.tabstop = TABSTOP or 4
vim.opt.shiftwidth = SHIFTWIDTH or 4
vim.opt.autoindent = AUTOINDENT or false
vim.opt.colorcolumn = string.format("%d", COLORCOLUMN or 80)
vim.opt.cursorline = CURSORLINE or false
vim.opt.cursorlineopt = CURSORLINEOPT or "number"
vim.opt.relativenumber = RELATIVENUMBERS or false
vim.opt.number = NUMBER or false
vim.opt.mouse = MOUSE or ""
vim.opt.signcolumn = SIGNCOLUMN and "yes" or "no"
vim.opt.wrap = WRAP or false
vim.opt.swapfile = SWAPFILE or false

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	float = { border = "rounded" },
})

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
