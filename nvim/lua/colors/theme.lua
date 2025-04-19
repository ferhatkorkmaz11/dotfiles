local M = {}

M.setup = function()
	local highlights = {
		Normal = { fg = "#ededed", bg = "#121212" },
		String = { fg = "#00ca50" },
		Keyword = { fg = "#ff4d8d" },
		Constant = { fg = "#47a8ff" },
		Function = { fg = "#c472fb" },
		Comment = { fg = "#5c6370" },
		Type = { fg = "#ff4d8d" },
		Identifier = { fg = "#47a8ff" },
		Statement = { fg = "#ff4d8d" },
		PreProc = { fg = "#ff4d8d" },
		Number = { fg = "#47a8ff" },
		Boolean = { fg = "#47a8ff" },
		Operator = { fg = "#ededed" },
		Special = { fg = "#c472fb" },
		Title = { fg = "#ededed" },
		Todo = { fg = "#ff4d8d" },
		DiagnosticError = { fg = "#ff4d8d" },
		DiagnosticWarn = { fg = "#c472fb" },
		DiagnosticInfo = { fg = "#47a8ff" },
		DiagnosticHint = { fg = "#00ca50" },
		CursorLine = { bg = "#2e2e2e" },
		Visual = { bg = "#3e4452" },
		LineNr = { fg = "#5c6370" },
		CursorLineNr = { fg = "#ededed" },
		Pmenu = { fg = "#ededed", bg = "#2e2e2e" },
		PmenuSel = { fg = "#121212", bg = "#47a8ff" },
		VertSplit = { fg = "#5c6370", bg = "#121212" },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M

