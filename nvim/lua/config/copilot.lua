-- Copilot configuration
local M = {}

M.setup = function()
    vim.g.copilot_enabled = false

    vim.api.nvim_create_user_command("CopilotEnable", function()
        vim.g.copilot_enabled = true
        print("✅ Copilot enabled")
    end, {})

    vim.api.nvim_create_user_command("CopilotDisable", function()
        vim.g.copilot_enabled = false
        print("❌ Copilot disabled")
    end, {})
end

return M