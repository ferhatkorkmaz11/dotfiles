-- Lualine configuration
local M = {}

M.setup = function()
    local custom_theme = {
        normal = {
            a = { bg = "#ff4d8d", fg = "#000000" },
            b = { bg = "#00ca50", fg = "#ededed" },
            c = { bg = "#000000", fg = "#ededed" },
        },
        insert = {
            a = { bg = "#47a8ff", fg = "#000000" },
            b = { bg = "#00ca50", fg = "#ededed" },
            c = { bg = "#000000", fg = "#ededed" },
        },
        visual = {
            a = { bg = "#c472fb", fg = "#000000" },
            b = { bg = "#00ca50", fg = "#ededed" },
            c = { bg = "#000000", fg = "#ededed" },
        },
        replace = {
            a = { bg = "#ff4d8d", fg = "#000000" },
            b = { bg = "#00ca50", fg = "#ededed" },
            c = { bg = "#000000", fg = "#ededed" },
        },
        command = {
            a = { bg = "#c472fb", fg = "#000000" },
            b = { bg = "#00ca50", fg = "#ededed" },
            c = { bg = "#000000", fg = "#ededed" },
        },
        inactive = {
            a = { bg = "#000000", fg = "#ededed" },
            b = { bg = "#000000", fg = "#ededed" },
            c = { bg = "#000000", fg = "#ededed" },
        },
    }

    require("lualine").setup({
        options = {
            theme = custom_theme,
            icons_enabled = true,
            section_separators = { left = "", right = "" },
            component_separators = { left = "", right = "" },
            globalstatus = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { { "filename", path = 1 } },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    })
end

return M