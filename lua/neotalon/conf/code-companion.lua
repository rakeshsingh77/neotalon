-- See https://codecompanion.olimorris.dev/getting-started
-- CoPilot is used by default.
-- If copilot.nvim is configured and functional, this should
-- automatically work.


local M = {}
local chat_adapter = "copilot"
local chat_model = "claude-haiku-4.5"
local inline_adapter = "copilot"
local inline_model = "claude-haiku-4.5"
local cmd_adapter = "copilot" 
local cmd_model = "claude-haiku-4.5"
local background_adapter = "copilot"
local background_model = "claude-haiku-4.5"

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

	require("render-markdown").setup({
		ft = { "markdown", "codecompanion" },
	})

	require("img-clip").setup({
		filetypes = {
			codecompanion = {
				prompt_for_filename = false,
				template = "[Image]($FILE_PATH)",
				use_absolute_path = true,
			}
		}
	})
end

return M
