-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Basic Settings
vim.opt.relativenumber = true
vim.opt.number = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

require("colors.theme").setup()

-- Plugins
require("lazy").setup({
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	{ "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, version = "*" },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "numToStr/Comment.nvim", opts = {}, lazy = false },
	{ "stevearc/conform.nvim", lazy = false },
	{ "github/copilot.vim", lazy = false },
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, config = true },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		config = true,
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<CR>", desc = "Open Neogit" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true,
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
	},
})

-- Treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "go", "java", "lua", "vim" },
	highlight = { enable = true },
	additional_vim_regex_highlighting = false,
})

-- Mason & LSP
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "ts_ls", "gopls", "jdtls", "lua_ls" },
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = capabilities,
			settings = (server_name == "lua_ls") and {
				Lua = {
					diagnostics = { globals = { "vim" } },
				},
			} or nil,
		})
	end,
})

-- Autocompletion (nvim-cmp)
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<Down>"] = cmp.mapping.select_next_item(),
		["<Up>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
	}),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}),
})

-- NvimTree
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

-- Telescope

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

-- Bufferline
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
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
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

require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettier", "eslint_d" },
		typescript = { "prettier", "eslint_d" },
		lua = { "stylua" },
		go = { "gofmt" },
		java = { "google-java-format" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- Keybindings
-- NvimTree
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fe", ":NvimTreeFocus<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fr", ":NvimTreeFindFile<CR>", { silent = true })

-- Telescope
vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ft", ":Telescope buffers<CR>", { silent = true })

-- Bufferline
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<Leader>bd", ":bdelete<CR>", { silent = true })
vim.keymap.set("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "Format current buffer" })
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { silent = true, noremap = true, desc = "Code Action" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true, noremap = true, desc = "Go to Definition" })
vim.keymap.set("n", "<Leader>q", ":cclose<CR>", { silent = true, noremap = true, desc = "Close Quickfix List" })
vim.keymap.set("n", "<Leader>lq", ":lclose<CR>", { silent = true, noremap = true, desc = "Close Location List" })

-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>")
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>")
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>")
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>")

vim.keymap.set("n", "gr", "<cmd>Trouble lsp toggle focus=true win.position=bottom<cr>", {
	desc = "LSP References with focus",
	silent = true,
	noremap = true,
})

-- Copilot
vim.g.copilot_enabled = false

vim.api.nvim_create_user_command("CopilotEnable", function()
	vim.g.copilot_enabled = true
	print("✅ Copilot enabled")
end, {})

vim.api.nvim_create_user_command("CopilotDisable", function()
	vim.g.copilot_enabled = false
	print("❌ Copilot disabled")
end, {})

vim.keymap.set("n", "<leader>ce", ":CopilotEnable<CR>", { desc = "Copilot Enable", silent = true })
vim.keymap.set("n", "<leader>cd", ":CopilotDisable<CR>", { desc = "Copilot Disable", silent = true })

-- Git
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open Neogit", silent = true })
vim.keymap.set("n", "]c", function()
	require("gitsigns").next_hunk()
end, { desc = "Next Git Hunk" })

vim.keymap.set("n", "[c", function()
	require("gitsigns").prev_hunk()
end, { desc = "Previous Git Hunk" })

vim.keymap.set("n", "<leader>gp", function()
	require("gitsigns").preview_hunk()
end, { desc = "Preview Git Hunk" })

vim.keymap.set("n", "<leader>gh", function()
	require("gitsigns").reset_hunk()
end, { desc = "Reset Git Hunk" })

vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<CR>", { desc = "Open Diffview", silent = true })
vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview", silent = true })
vim.keymap.set("n", "<leader>df", "<cmd>DiffviewFileHistory<CR>", { desc = "File History (Diffview)", silent = true })
