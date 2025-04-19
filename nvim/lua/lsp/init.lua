require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "ts_ls", "gopls", "lua_ls", "pyright" },
})

--- For Java, just use Jetbrains IDE with IdeaVim plugin :D. Not worth the setup hassle

local servers = { "ts_ls", "gopls", "lua_ls", "pyright" }
local handler = require("lsp.servers")

for _, srv in ipairs(servers) do
	handler.setup_common(srv)
end
