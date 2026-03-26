local toggle_key = "<M-a>"

return {
  "coder/claudecode.nvim",
  enabled = true,
  lazy = false,
  dependencies = { "folke/snacks.nvim" },
  opts = {
    terminal = {
      -- provider = "none", -- no UI actions; server + tools remain available

      snacks_win_opts = {
        position = "float",
        border = "rounded",
        width = 0.9,
        height = 0.9,
        backdrop = 20,

        -- position = "bottom",
        -- height = 0.5,
        -- width = 1.0,
        -- border = "single",

        keys = {
            claude_hide = {toggle_key, function(self) self:hide() end, mode = "t", desc = "Hide",},
        },
      },
    },
  },
  keys = {
    { toggle_key, "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code", mode = { "n", "x" } },
    { "<leader>a", nil, desc = "AI/Claude Code" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    { "<leader>as", function()
        vim.cmd("normal! V")
        vim.cmd("ClaudeCodeSend")
      end, mode= "n", desc = "Send line to Claude",
    },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    -- Diff management
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
}
