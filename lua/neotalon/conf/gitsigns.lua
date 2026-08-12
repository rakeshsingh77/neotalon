local M = {}

function M.setup()
    require("gitsigns").setup({
        current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
        current_line_blame = true,
        signs = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signs_staged = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signs_staged_enable = true,
        signcolumn = true,
        numhl      = true,
        linehl     = false,
        word_diff  = false,
    })
    vim.opt.signcolumn = SIGNCOLUMN or "yes:2"
end

return M
