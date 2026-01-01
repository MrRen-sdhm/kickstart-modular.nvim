return {
  "zbirenbaum/copilot.lua",
  enabled = false,
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true, -- enable auto trigger
      hide_during_completion = true, -- hide suggestions when completion menu is visible
      -- auth_provider_url = "https://example.com/",
      -- default keymaps (insert mode only)
      -- keymap = {
      --   accept = "<M-l>",
      --   accept_word = false,
      --   accept_line = false,
      --   next = "<M-]>",
      --   prev = "<M-[>",
      --   dismiss = "<C-]>",
      -- },
    },
    panel = { enabled = true },
    filetypes = {
      markdown = true,
      lua = true,
      c = true,
      help = true,
    },
  },
}
