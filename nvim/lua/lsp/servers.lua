local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local M = {}

function M.setup_common(server_name, opts)
	opts = opts or {}
	opts.capabilities = capabilities
	if server_name == "lua_ls" then
		opts.settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
			},
		}
	end
	lspconfig[server_name].setup(opts)
end

return M
