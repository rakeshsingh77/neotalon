-- Installs the nvim-autopairs plugin for automatic pairing of
-- brackets and quotes
-- https://github.com/windwp/nvim-autopairs

return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	config = true,
	opts = function()
		run_config("nvim-autopairs")
	end,
}
