
local M = {}

function M.setup()
    require("atone").setup({
        layout = {
            ---@type "left"|"right"
            direction = "right",
        }
    })
end

return M
