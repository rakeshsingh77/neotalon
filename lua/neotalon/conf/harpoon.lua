local M = {}

function M.setup()
	local harpoon = require("harpoon")
	require("harpoon").setup({
		harpoon:setup(
			{
				settings = {
					save_on_toggle = true,
					save_on_change = true,				}
			}
		),
	})
end

return M
