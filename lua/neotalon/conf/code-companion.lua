-- See https://codecompanion.olimorris.dev/getting-started
-- CoPilot is used by default.
-- If copilot.nvim is configured and functional, this should
-- automatically work.


local M = {}

function M.setup()
	-- Default chat adapter. Change to "openai" or "anthropic" to switch defaults.
    -- This can be changed in vars/ai.lua
	local default_chat_adapter = "copilot"
    local default_chat_model = "claude-sonnet-4.6"

	require("codecompanion").setup({
		interactions = {
			chat = {
				adapter = {
					name = CHAT_ADAPTER or default_chat_adapter,
					model = CHAT_MODEL or default_chat_model,
				},
			},
			inline = {
				adapter = INLINE_ADAPTER,
			},
			cmd = {
				adapter = CMD_ADAPTER,
			},
			background = {
				adapter = {
					name = BACKGROUND_ADAPTER,
					model = BACKGROUND_MODEL,
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
