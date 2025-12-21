return {
  "akinsho/bufferline.nvim",
  -- event = "VeryLazy", -- WARN: will show bufferline on snacks dashbord
  lazy = false,
  keys = {
    -- { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    -- { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",  desc = "Delete Buffers to the Left" },
    -- { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    -- { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>",  desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>",  desc = "Next Buffer" },
    -- { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    -- { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  },
  opts = {
    highlights = {
      buffer_selected = {
        italic = false, -- selected buffer do not use italic font
      },
    },
    options = {
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
        {
          filetype = "snacks_layout_box",
        },
      },
    }
  }
}
