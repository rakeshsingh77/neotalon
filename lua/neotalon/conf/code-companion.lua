local M = {}

function M.setup()
	require("codecompanion").setup({
		strategies = {
			chat = {
				adapter = "openai",
			},
			inline = {
				adapter = "openai",
			},
		},
		adapters = {
			openai = function()
				return require("codecompanion.adapters").extend("openai", {
					env = {
						api_key = os.getenv("OPENAI_API_KEY"),
					},
				})
			end,
			anthropic = function()
				return require("codecompanion.adapters").extend("anthropic", {
					env = {
						api_key = os.getenv("ANTHROPIC_API_KEY"),
					},
				})
			end,
			azure_openai = function()
				return require("codecompanion.adapters").extend("azure_openai", {
					env = {
						api_key = os.getenv("AZURE_OPENAI_API_KEY"),
						endpoint = os.getenv("AZURE_OPENAI_ENDPOINT"),
						deployment_id = os.getenv("AZURE_OPENAI_DEPLOYMENT_ID"),
					},
				})
			end,
			copilot = function()
				return require("codecompanion.adapters").extend("copilot", {})
			end,
			gemini = function()
				return require("codecompanion.adapters").extend("gemini", {
					env = {
						api_key = os.getenv("GOOGLE_API_KEY"),
					},
				})
			end,
			ollama = function()
				return require("codecompanion.adapters").extend("ollama", {
					env = {
						endpoint = os.getenv("OLLAMA_ENDPOINT") or "http://localhost:11434",
					},
				})
			end,
		},
	})
end

return M
