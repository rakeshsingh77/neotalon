-- See https://codecompanion.olimorris.dev/getting-started
-- CoPilot is used by default.
-- If copilot.nvim is configured and functional, this should
-- automatically work.


local M = {}
local chat_adapter = "copilot"
local chat_model = "gpt-4.1"
local inline_adapter = "copilot"
local inline_model = "gpt-4.1"
local cmd_adapter = "copilot" 
local cmd_model = "gpt-4.1"
local background_adapter = "copilot"
local background_model = "gpt-4.1"

function M.setup()
	-- Default chat adapter. Change to "openai" or "anthropic" to switch defaults.
	local default_chat_adapter = "copilot"

	require("codecompanion").setup({
		interactions = {
			chat = {
				adapter = {
					name = chat_adapter,
					model = chat_model,
				},
			},
			inline = {
				adapter = inline_adapter,
			},
			cmd = {
				adapter = cmd_adapter,
			},
			background = {
				adapter = {
					name = background_adapter,
					model = background_model,
				},
			},
		},
	})
end

return M
