return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- explorer = { enabled = true },
    input = {
      enabled = true,
    },
    picker = {
      enabled = false,
      win = {
        -- input window
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
    },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
    -- scope = { enabled = true },
    notifier = {
      enabled = false,
      timeout = 3000,
      icons = { error = "", warn = "", info = "", debug = "", trace = "", }, -- disable icon
      -- padding = false,
      -- style = 'fancy' -- compact/fancy/minimal
    },
    quickfile = { enabled = true },
    scroll = { enabled = true, }, -- Smooth scrolling
    bigfile = { enabled = true },
    indent = {
      enabled = false,
      indent = {
        only_scope = true, -- only show indent guides of the scope
        only_current = true -- only show indent guides in the current window
      },
    },
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Select Session", action = ":PossessionPick" }, -- Possession Pick
          { icon = " ", key = "S", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
    styles = {
      notification = {
        border = true,
        zindex = 100,
        ft = "markdown",
        wo = {
          winblend = 0,
          wrap = true,
        },
      },
      notification_history = {
        border = true,
        zindex = 100,
        width = 0.6,
        height = 0.6,
        minimal = false,
        title = " Notification History ",
        title_pos = "center",
        ft = "markdown",
        keys = { q = "close" },
      },
      input = {
        row = 15,
        wo = {
          winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle,LineNr:SnacksInputNormal",
          cursorline = false,
        },
      },
    },
  },
  keys = {
    { "<leader>tt", function() Snacks.terminal() end, desc = "[T]oggle [T]erminal" },
    { "<leader>sH", function() Snacks.picker.highlights() end, desc = "[S]earch [H]ighlights" },
    { "<leader>S", function() Snacks.picker() end, desc = "[S]nacks Picker" },
    -- { "<leader>n", function() Snacks.notifier.show_history() end, desc = "[N]otification History" },
    -- { "<leader>n", function() Snacks.picker.notifications() end, desc = "[N]otification History" },
  },
  init = function ()
    vim.api.nvim_create_user_command("NotifyHistory", function()
      Snacks.notifier.show_history()
    end, { desc = "show notifier history", } )

    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- create key map
        Snacks.toggle.indent():map("<leader>ti") -- toggle indent guides
      end,
    })

    -- do not show endofbuffer for snacks_dashboard
    vim.api.nvim_create_autocmd("User", {
      pattern = "SnacksDashboard*",
      callback = function()
        if vim.bo.filetype == "snacks_dashboard" then
          vim.opt_local.fillchars:append({ eob = " " })
        end
      end,
    })
  end
}

-- vim: ts=2 sts=2 sw=2 et
