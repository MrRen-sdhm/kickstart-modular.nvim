return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    enabled = true,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      local use_molokai = true

      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
          keywords = { italic = true },
        },
        -- plugins = {
        --   all = false,
        -- },

        -- default color: https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_moon.lua
        on_colors = function(c)
          if not use_molokai then
            return
          end
          -- bg of molokai
          c.bg = "#121212"
          c.bg_popup = "#121212"
          c.bg_float = "#121212"
          c.bg_visual = "#262626"
          c.bg_sidebar = "#121212"
          c.bg_statusline = "#202020"

          c.fg = "#d0d0d0"
          c.fg_dark = "#d0d0d0"
          c.fg_float = "#d0d0d0"
          c.fg_gutter = "#3b4261"
          c.fg_sidebar = "#d0d0d0"

          -- color of molokai
          -- c.red = "#ff5fff"
          -- c.orange = "#ff8700"
          -- c.yellow = "#d7d787"
          -- c.green = "#afd787"
          -- c.blue = "#5fd7ff"
          -- c.magenta = "#af5fff"
          -- c.cyan = "#87d7ff"
          -- c.gray = "#5f5f5f"
        end,
        -- highlight groups: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/groups/base.lua
        on_highlights = function(hl)
          if not use_molokai then
            return
          end

          -- hl.String      = { fg = "#8ece6a" }
          hl.Comment     = { fg = "#5f5f5f" }
          -- hl.SignColumn  = { bg = "#303030" }
          -- hl.Number      = { fg = "#af5fff" }
          -- hl.Boolean     = { fg = "#af5fff" }
          -- hl.Keyword     = { fg = "#F92672" }
          -- hl.Function    = { fg = "#A6E22E" }
          -- hl.Identifier  = { fg = "#FD971F" }
          -- hl.Type        = { fg = "#66D9EF" }
          hl.LineNr       = { fg="#bcbcbc", bg="#303030" }
          -- hl.LineNr       = { fg="#bcbcbc" }
          -- hl.LineNr       = { fg = "#5f5f5f" }
          hl.SpecialKey   = { fg = "#5f5f5f" }
          hl.NonText      = { fg = "#5f5f5f" }
          hl.CursorColumn = { bg = "#303030" }
          hl.ColorColumn  = { bg = "#303030" }
          hl.CursorLine   = { bg = "#1c1c1c" }
          hl.CursorLineNr = { fg = "#ff8700" }
          hl.Whitespace   = { fg = "#5f5f5f" } -- "nbsp", "space", "tab" and "trail" in 'listchars'
          hl.WinSeparator = { fg = "#808080", bold=true } -- the column separating vertically split windows
          -- hl.EndOfBuffer  = { fg="#5f5f5f" }
        end,
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-moon'
      -- vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
