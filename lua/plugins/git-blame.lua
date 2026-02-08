return {
  "f-person/git-blame.nvim",
  -- load the plugin at startup
  event = "VeryLazy",
  -- Because of the keys part, you will be lazy loading this plugin.
  -- The plugin will only load once one of the keys is used.
  -- If you want to load the plugin at startup, add something like event = "VeryLazy",
  -- or lazy = false. One of both options will work.
  opts = {
    enabled = true,  -- if you want to enable the plugin
    message_template = "<<sha>> | <date> | <author> | <summary>", -- template for the blame message, check the Message template section for more options
    date_format = "%Y-%m-%d %H:%M:%S", -- template for the date, check Date format section for more options
    display_virtual_text = 0, -- display virtual text at right of current line
    virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
  },
  keys = {
    { "<leader>gb", function()
        local gb = require("gitblame")
        if gb.is_blame_text_available() then
          print(gb.get_current_blame_text())
        end
      end, desc = "Git blame line message print"
    },
  },
}
