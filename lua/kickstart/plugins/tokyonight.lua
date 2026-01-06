return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
        on_colors = function(c)
          -- c.bg = "#202232"

          -- bg of tokyonight-night
          -- c.bg = "#16161e"

          -- bg of molokai
          c.bg = "#121212"
          c.bg_popup = "#121212"
          c.bg_float = "#121212"
          c.bg_sidebar = "#121212"

          -- color of molokai
          -- c.red = "#ff5fff"
          c.orange = "#ff8700"
          -- c.yellow = "#d7d787"
          -- c.green = "#afd787"
          -- c.blue = "#5fd7ff"
          c.magenta = "#af5fff"
          -- c.cyan = "#87d7ff"
          -- c.gray = "#5f5f5f"

          -- color of tokyonight-moon
          -- c.bg = "#222436"
          -- c.bg_dark = "#1e2030"
          -- c.bg_dark1 = "#191B29"
          -- c.bg_float = "#1e2030"
          -- c.bg_highlight = "#2f334d"
          -- c.bg_popup = "#1e2030"
          -- c.bg_search = "#3e68d7"
          -- c.bg_sidebar = "#1e2030"
          -- c.bg_statusline = "#1e2030"
          -- c.bg_visual = "#2d3f76"
        end,
        on_highlights = function(hl)
          hl.String      = { fg = "#9ece6a" }
          -- hl.Comment     = { fg = "#87d7ff" }
          -- hl.Number      = { fg = "#af5fff" }
          -- hl.Boolean     = { fg = "#af5fff" }
          -- hl.Keyword     = { fg = "#F92672" }
          -- hl.Function    = { fg = "#A6E22E" }
          -- hl.Identifier  = { fg = "#FD971F" }
          -- hl.Type        = { fg = "#66D9EF" }
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
