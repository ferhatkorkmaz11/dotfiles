-- Conform.nvim formatter configuration
local M = {}

M.setup = function()
    local function resolve_prettier_global()
        local npm_prefix = vim.fn.system("npm config get prefix"):gsub("\n", "")
        local prettier = npm_prefix .. "/bin/prettier"
        local plugin = npm_prefix .. "/lib/node_modules/prettier-plugin-organize-imports/index.js"

        if vim.fn.filereadable(prettier) ~= 1 then
            vim.notify("Global Prettier not found at: " .. prettier, vim.log.levels.ERROR)
            return nil
        end

        if vim.fn.filereadable(plugin) ~= 1 then
            vim.notify("prettier-plugin-organize-imports not found at: " .. plugin, vim.log.levels.ERROR)
            return nil
        end

        return {
            command = prettier,
            args = {
                "--plugin",
                plugin,
                "--stdin-filepath",
                "$FILENAME",
            },
            stdin = true,
        }
    end

    require("conform").setup({
        formatters_by_ft = {
            javascript = { "prettier_global" },
            typescript = { "prettier_global" },
            lua = { "stylua" },
            go = { "gofmt" },
            java = { "google-java-format" },
        },
        formatters = {
            prettier_global = resolve_prettier_global() or {},
        },
        format_on_save = {
            lsp_fallback = true,
            timeout_ms = 1000,
        },
    })
end

return M