vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fe", ":NvimTreeFocus<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fr", ":NvimTreeFindFile<CR>", { silent = true })

vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ft", ":Telescope buffers<CR>", { silent = true })

vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<Leader>bd", ":bdelete<CR>", { silent = true })

vim.keymap.set("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "Format current buffer" })

vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { silent = true, noremap = true, desc = "Code Action" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true, noremap = true, desc = "Go to Definition" })
vim.keymap.set("n", "gr", "<cmd>Trouble lsp toggle focus=true win.position=bottom<cr>", {
	desc = "LSP References with focus",
	silent = true,
	noremap = true,
})

vim.keymap.set("n", "<Leader>q", ":cclose<CR>", { silent = true, noremap = true, desc = "Close Quickfix List" })
vim.keymap.set("n", "<Leader>lq", ":lclose<CR>", { silent = true, noremap = true, desc = "Close Location List" })

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>")
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>")
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>")
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>")

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename", noremap = true, silent = true })

vim.keymap.set("n", "<leader>ce", ":CopilotEnable<CR>", { desc = "Copilot Enable", silent = true })
vim.keymap.set("n", "<leader>cd", ":CopilotDisable<CR>", { desc = "Copilot Disable", silent = true })

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
