return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
    -- labels = "asdfjklghcvnmeruiwotybzxqp",
    labels = "asdfjklcverghnmuiwotybzxqp",
    label = {
      -- allow uppercase labels
      uppercase = true,
    },
    modes = {
        -- disable enhanced [f F t T ; ,]
        char = { enabled = false },
        -- enable enhanced [f F t T ; ,] and enable jump labels
        -- char = { enabled = true, jump_labels = true },
    },
    highlight = {
        -- disable backdrop
        backdrop = false,
    },
  },
  keys = {
    { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "F", mode = { "n", "x", "o" }, function()
      require("flash").treesitter({
        actions = {["<CR>"] = "next", ["<BS>"] = "prev"}
      }) end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    { "<leader>j", mode = { "n", "x", "o" }, function()
      require("flash").jump({
        search = { mode = "search", max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = "^"
      }) end, desc = "Flash jump to a line" },
  },
}
