-- TreeSitter configuration
local M = {}

M.setup = function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "typescript", "go", "java", "lua", "vim" },
        highlight = { enable = true },
        additional_vim_regex_highlighting = false,
    })
end

return M