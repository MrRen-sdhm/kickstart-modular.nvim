return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'MrRen-sdhm/tokyonight-molokai.nvim',
    enabled = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
        -- default color: https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_moon.lua
        on_colors = function(c)
          c.red       = "#ff5fff"  -- cterm 197
          c.orange    = "#ff8700"  -- cterm 208
          c.yellow    = "#d7d787"  -- cterm 186
          c.green     = "#afd787"  -- cterm 148
          c.blue      = "#5fd7ff"  -- cterm 81 
          c.magenta   = "#af5fff"  -- cterm 135
          c.cyan      = "#87d7ff"  -- cterm 117
          c.gray      = "#5f5f5f"  -- cterm 59 
          c.bg        = "#121212"  -- cterm 233
          c.fg        = "#d0d0d0"  -- cterm 252
          c.fg_gutter = "#5f5f5f"
        end,
        -- highlight groups: https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/groups/base.lua
        on_highlights = function(hl)
          hl.Normal       = { fg="#d0d0d0", bg="#121212" } -- 252 / 233
          hl.CursorLine   = { bg="#1c1c1c" }               -- 234
          hl.CursorLineNr = { fg="#ff8700" }               -- 208

          hl.Boolean      = { fg="#af5fff" }               -- 135
          hl.Character    = { fg="#afaf87" }               -- 144
          hl.Number       = { fg="#af5fff" }               -- 135,
          hl.String       = { fg="#afaf87" }               -- 144
          hl.Conditional  = { fg="#d7005f", bold=true }    -- 161
          hl.Constant     = { fg="#af5fff", bold=true }    -- 135

          hl.Cursor       = { fg="#000000", bg="#dadada" } -- 16 / 253
          hl.Debug        = { fg="#ffd7ff", bold=true }    -- 225
          hl.Define       = { fg="#5fd7ff" }               -- 81
          hl.Delimiter    = { fg="#626262" }               -- 241

          hl.DiffAdd      = { bg="#005f87" }               -- 24
          hl.DiffChange   = { fg="#e4e4c8", bg="#4e4e4e" } -- 181 / 239
          hl.DiffDelete   = { fg="#d70087", bg="#5f005f" } -- 162 / 53
          hl.DiffText     = { bg="#878700", bold=true }    -- 102

          hl.Directory    = { fg="#87ff00", bold=true }    -- 118
          hl.Error        = { fg="#ffafff", bg="#87005f" } -- 219 / 89
          hl.ErrorMsg     = { fg="#ff5f87", bg="#000000", bold=true } -- 199 / 16
          hl.Exception    = { fg="#87ff00", bold=true }    -- 118

          hl.Float        = { fg="#af5fff" }               -- 135
          hl.FoldColumn   = { fg="#5f87af", bg="#000000" } -- 67 / 16
          hl.Folded       = { fg="#5f87af", bg="#000000" } -- 67 / 16
          hl.Function     = { fg="#87ff00" }               -- 118

          hl.Identifier   = { fg="#ff8700" }               -- 208
          hl.Ignore       = { fg="#808080", bg="#080808" } -- 244 / 232
          -- hl.IncSearch    = { fg="#d7ffaf", bg="#000000" } -- 193 / 16
          hl.IncSearch    = { fg="#d7ffaf", bg="#ff8700" } -- 193 / 208

          hl.Keyword      = { fg="#d7005f", bold=true }    -- 161
          hl.Label        = { fg="#ffffd7" }               -- 229
          hl.Macro        = { fg="#d7ffaf" }               -- 193
          hl.SpecialKey   = { fg="#5fd7ff" }               -- 81

          hl.MatchParen   = { fg="#121212", bg="#ff8700", bold=true } -- 233 / 208

          hl.ModeMsg      = { fg="#ffffd7" }               -- 229
          hl.MoreMsg      = { fg="#ffffd7" }               -- 229
          hl.Operator     = { fg="#d7005f" }               -- 161

          hl.Pmenu        = { fg="#5fd7ff", bg="#000000" } -- 81 / 16
          hl.PmenuSel     = { fg="#eeeeee", bg="#6c6c6c" } -- 255 / 242
          hl.PmenuSbar    = { bg="#080808" }               -- 232
          hl.PmenuThumb   = { fg="#5fd7ff" }               -- 81

          hl.PreCondit    = { fg="#87ff00", bold=true }    -- 118
          hl.PreProc      = { fg="#87ff00" }               -- 118
          hl.Question     = { fg="#5fd7ff" }               -- 81
          hl.Repeat       = { fg="#d7005f", bold=true }    -- 161
          hl.Search       = { fg="#000000", bg="#ffd75f" } -- 0 / 222

          hl.SignColumn   = { fg="#87ff00", bg="#262626" } -- 118 / 235
          hl.SpecialChar  = { fg="#d7005f", bold=true }    -- 161
          hl.SpecialComment = { fg="#8a8a8a", bold=true }  -- 245
          hl.Special      = { fg="#5fd7ff" }               -- 81

          hl.SpellBad     = { bg="#5f0000" }               -- 52
          hl.SpellCap     = { bg="#00005f" }               -- 17
          hl.SpellLocal   = { bg="#00005f" }               -- 17
          hl.SpellRare    = { reverse=true }               -- reverse only

          hl.Statement    = { fg="#d7005f", bold=true }    -- 161

          hl.StatusLine   = { fg="#444444", bg="#dadada" } -- 238 / 253
          hl.StatusLineNC = { fg="#808080", bg="#080808" } -- 244 / 232

          hl.StorageClass = { fg="#ff8700" }               -- 208
          hl.Structure    = { fg="#5fd7ff" }               -- 81

          hl.Tag          = { fg="#d7005f" }               -- 161
          hl.Title        = { fg="#d75f00" }               -- 166
          hl.Todo         = { fg="#ffffff", bg="#080808", bold=true } -- 231 / 232

          hl.Typedef      = { fg="#5fd7ff" }               -- 81
          hl.Type         = { fg="#5fd7ff" }               -- 81
          hl.Underlined   = { fg="#808080", underline=true } -- 244

          hl.VertSplit    = { fg="#808080", bg="#080808", bold=true } -- 244 / 232

          hl.VisualNOS    = { bg="#444444" }               -- 238
          hl.Visual       = { bg="#262626" }               -- 235

          hl.WarningMsg   = { fg="#ffffff", bg="#444444", bold=true } -- 231 / 238
          hl.WildMenu     = { fg="#5fd7ff", bg="#000000" } -- 81 / 16

          hl.Comment      = { fg="#5f5f5f" }               -- 59
          hl.CursorColumn = { bg="#303030" }               -- 236
          hl.ColorColumn  = { bg="#303030" }               -- 236
          -- hl.LineNr       = { fg="#bcbcbc", bg="#303030" } -- 250 / 236
          hl.LineNr       = { fg="#bcbcbc" } -- 250 / 236
          hl.NonText      = { fg="#5f5f5f" }               -- 59

          hl.SpecialKey   = { fg="#5f5f5f" }               -- 59

          -- add for molokai theme
          hl.NormalNC     = { fg="#d0d0d0", bg="#121212" } -- 252 / 233
          hl.NormalSB     = { fg="#d0d0d0", bg="#121212" } -- 252 / 233
          hl.NormalFloat  = { fg="#5fd7ff", bg="#000000" } -- 81 / 16
          hl.MsgArea      = { fg="#d0d0d0", bg="#080808" } -- 252 / 232
          hl.WinSeparator = { fg="#808080", bg="#080808", bold=true } -- 244 / 232
          hl.EndOfBuffer  = { fg="#5f5f5f" }               -- 59

          -- for plugin
          -- hl.WhichKey             = { fg = "#7dcfff" }
          -- hl.WhichKeyDesc         = { fg = "#d7005f" }
          -- hl.WhichKeyGroup        = { fg = "#7aa2f7" }
          -- hl.WhichKeyNormal       = { bg = "#16161e" }
          -- hl.WhichKeySeparator    = { fg = "#565f89" }
          -- hl.WhichKeyValue        = { fg = "#737aa2" }
        end,
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-moon'
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

