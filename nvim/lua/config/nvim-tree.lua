-- NvimTree configuration
local M = {}

M.setup = function()
    require("nvim-tree").setup({
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)
            vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
        end,
        filters = { dotfiles = false, git_ignored = false },
        actions = {
            open_file = {
                quit_on_open = false,
                window_picker = { enable = false },
            },
        },
    })

    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            local directory = vim.fn.argv(0)
            if vim.fn.isdirectory(directory) == 1 then
                vim.cmd.cd(directory)
                require("nvim-tree.api").tree.open()
            end
        end,
    })
end

return M