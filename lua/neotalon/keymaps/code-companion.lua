local wk = require("which-key")
wk.add({
    { "<leader>a", name = "AI Code Companion" },
    { "<leader>ac", "<cmd>CodeCompanion chat<CR>", desc = "Chat" },
    { "<leader>as", "<cmd>CodeCompanion summarize<CR>", desc = "Summarize" },
    { "<leader>ae", "<cmd>CodeCompanion explain<CR>", desc = "Explain" },
    { "<leader>ar", "<cmd>CodeCompanion refactor<CR>", desc = "Refactor" },
})