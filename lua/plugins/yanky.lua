return {
  "gbprod/yanky.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "kkharji/sqlite.lua",
  },
  opts = {
      ring = {
        history_length = 100,
        -- Available storage: shada, sqlite or memory
        storage = "sqlite",
        sync_with_numbered_registers = true,
        cancel_event = "update",
        ignore_registers = { "_" },
        update_register_on_cycle = false,
        permanent_wrapper = nil,
      },
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 300,
      },
      system_clipboard = {
        -- https://github.com/gbprod/yanky.nvim?tab=readme-ov-file#system_clipboardsync_with_ring
        -- Yanky can automatically adds to ring history yanks that occurs outside of Neovim. This works regardless to your &clipboard setting.
        -- WARN: if you not config clipboard provider, should disable it, or will produce warning: `clipboard: No provider. Try ":checkhealth" or ":h clipboard".`
        sync_with_ring = false,
      },
      preserve_cursor_position = {
        enabled = true,
      },
  },
  keys = {
    -- { "<leader>sy", "<cmd>YankyRingHistory<cr>", mode = { "n", "x" }, desc = "[S]earch [Y]ank History" }, -- use vim.ui.select
    { "<leader>sy", "<cmd>Telescope yank_history<cr>", mode = { "n", "x" }, desc = "[S]earch [Y]ank History" }, -- use telescope
    -- { "<leader>sy", function() Snacks.picker.yanky() end, mode = { "n", "x" }, desc = "[S]earch [Y]ank History" }, -- use telescope
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
    { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put after cursor and leave the cursor after" },
    { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put before cursor and leave the cursor after" },
  }
}
