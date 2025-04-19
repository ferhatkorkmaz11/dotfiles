require("settings")
require("plugins")
require("colors").setup()

-- Plugin configurations
require("config.nvim-tree").setup()
require("config.bufferline").setup()
require("config.telescope").setup()
require("config.treesitter").setup()
require("config.cmp").setup()
require("config.lualine").setup()
require("config.copilot").setup()
require("config.conform").setup()

require("mappings")
require("lsp")
