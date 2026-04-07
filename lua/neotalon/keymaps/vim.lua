-- Standard VIM key bindings
-- @module neotalon.keymaps.vim

---@type string Leader key for key mappings
MAPLEADER = MAPLEADER or " "
---@type string Local leader key for key mappings
MAPLOCALLEADER = MAPLOCALLEADER or "\\"
---@type string ToggleTerm key binding
TOGGLETERM_KEY = TOGGLETERM_KEY or "<C-_>"

-- Set the Leader key
vim.g.mapleader = MAPLEADER
vim.g.maplocalleader = MAPLOCALLEADER

-- Move current line down with Alt-j
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })
-- Move current line up with Alt-k
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })

-- Move selected lines in visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })

-- Map key for ToggleTerm (only if loaded)
local ok, _ = pcall(require, "toggleterm")
if ok then
	vim.keymap.set("n", TOGGLETERM_KEY, ":ToggleTerm<CR>", { noremap = true, silent = true, desc = "Toggle terminal" })
	vim.keymap.set("t", TOGGLETERM_KEY, "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true, desc = "Exit terminal" })
end
