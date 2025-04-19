-- Bufferline configuration
local M = {}

M.setup = function()
    require("bufferline").setup({
        options = {
            mode = "tabs",
            diagnostics = "nvim_lsp",
            separator_style = "slant",
            show_close_icon = false,
            show_buffer_close_icons = true,
            always_show_bufferline = true,
        },
    })
end

return M