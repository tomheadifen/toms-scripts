return {
    "coder/claudecode.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
        { "<leader>a", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
        { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
        { "<leader>ao", "<cmd>ClaudeCodeOpen<cr>", desc = "Open Claude Code" },
        { "<leader>ac", "<cmd>ClaudeCodeClose<cr>", desc = "Close Claude Code" },
        { "<Esc>", "<C-\\><C-n><C-w>p", mode = "t", desc = "Exit Claude Code to editor" },
    },
}
