-- Telescope configuration
local M = {}

M.setup = function()
    require("telescope").setup({
        defaults = {
            mappings = {
                i = {
                    ["<CR>"] = require("telescope.actions").select_default + require("telescope.actions").center,
                    ["<C-t>"] = require("telescope.actions").select_tab,
                },
                n = {
                    ["<CR>"] = require("telescope.actions").select_default + require("telescope.actions").center,
                    ["<C-t>"] = require("telescope.actions").select_tab,
                },
            },
        },
    })
end

return M