-- copilot.lua

-- return {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   event = "InsertEnter",
--   opts = {
--     suggestion = {
--       enabled = true,
--       auto_trigger = true, -- enable auto trigger
--       hide_during_completion = true, -- hide suggestions when completion menu is visible
--       -- auth_provider_url = "https://example.com/",
--       -- default keymaps (insert mode only)
--       -- keymap = {
--       --   accept = "<M-l>",
--       --   accept_word = false,
--       --   accept_line = false,
--       --   next = "<M-]>",
--       --   prev = "<M-[>",
--       --   dismiss = "<C-]>",
--       -- },
--     },
--     panel = { enabled = true },
--     filetypes = {
--       markdown = true,
--       lua = true,
--       c = true,
--       help = true,
--     },
--   },
-- }

-- copilot.vim

return {
  "github/copilot.vim",
  cmd = "Copilot",
  event = "BufWinEnter",
  init = function()
    vim.g.copilot_enterprise_uri = 'https://example.com'
    -- vim.g.copilot_no_maps = true
  end,
  -- config = function()
  --   -- Block the normal Copilot suggestions
  --   vim.api.nvim_create_augroup("github_copilot", { clear = true })
  --   vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
  --     group = "github_copilot",
  --     callback = function(args)
  --       vim.fn["copilot#On" .. args.event]()
  --     end,
  --   })
  --   vim.fn["copilot#OnFileType"]()
  -- end,
}
