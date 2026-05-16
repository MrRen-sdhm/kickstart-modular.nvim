return {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- local tokyonight_molokai = require("lualine.themes._tokyonight").get("moon")
    -- tokyonight_molokai.normal.c.bg = '#202020'
    -- tokyonight_molokai.normal.c.fg = '#eeeeee'

    require("lualine").setup({
      options = {
        theme = "auto",
        -- theme = 'tokyonight-moon',
        -- theme = 'tokyonight-night',
        -- theme = tokyonight_molokai, -- custom theme
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true; -- enable global statusline (have a single statusline at bottom of neovim instead of one for every window).
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
      },
      sections = {
        lualine_b = {
          { "branch" },
          {
            "diff",
              source = function()
                local gs = vim.b.gitsigns_status_dict
                if not gs then return {} end
                return {
                  added = gs.added,
                  modified = gs.changed,
                  removed = gs.removed,
                }
              end,
          },
          {
            "diagnostics",

            -- Table of diagnostic sources, available sources are:
            --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
            -- or a function that returns a table as such:
            --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
            sources = { 'nvim_diagnostic', 'coc' },

            -- Displays diagnostics for the defined severity types
            -- sections = { 'error', 'warn', 'info', 'hint' },
            sections = { 'error' }, -- only show error
          },
        },
        lualine_c = {
          {
            "filename",
            -- path = 0, -- 0: Just the filename
            path = 3, -- shows the full path and shorten $HOME to ~
          },
        },
        lualine_x = {
          -- https://github.com/folke/noice.nvim?tab=readme-ov-file#-statusline-components
          -- {
          --   require("noice").api.status.message.get_hl,
          --   cond = require("noice").api.status.message.has,
          -- },
          -- {
          --   require("noice").api.status.command.get,
          --   cond = require("noice").api.status.command.has,
          --   color = { fg = "#ff9e64" },
          -- },
          -- {
          --   require("noice").api.status.mode.get,
          --   cond = require("noice").api.status.mode.has,
          --   color = { fg = "#ff9e64" },
          -- },
          -- {
          --   require("noice").api.status.search.get,
          --   cond = require("noice").api.status.search.has,
          --   color = { fg = "#ff9e64" },
          -- },

          -- {
          --   'searchcount',
          --   maxcount = 999,
          --   timeout = 500,
          -- },
          {
            'encoding',
          },
          {
            'fileformat',
            symbols = {
              -- unix = '', -- e712
              -- dos = '',  -- e70f
              -- mac = '',  -- e711
              unix = 'unix',
              dos = 'dos',
              mac = 'mac',
            }
          },
          { 'filetype' },
          {
            function() return vim.g.gtags_running and " Gtags" or "" end,
            color = function() return vim.g.gtags_running and { fg = "#ff9e64" } end,
          },
        },
        lualine_y = {
          {
            "aerial",
            -- The separator to be used to separate symbols in status line.
            sep = " ) ",

            -- The number of symbols to render top-down. In order to render only 'N' last
            -- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
            -- be used in order to render only current symbol.
            depth = nil,

            -- When 'dense' mode is on, icons are not rendered near their symbols. Only
            -- a single icon that represents the kind of current symbol is rendered at
            -- the beginning of status line.
            dense = false,

            -- The separator to be used to separate symbols in dense mode.
            dense_sep = ".",

            -- Color the symbol icons.
            colored = true,
          },
          {
            "progress",
          },
        },
        lualine_z = {
          {
            'location',
            fmt = function(str)
              local line, col = str:match('(%d+):(%d+)')
              if not line then
                return str
              end
              return string.format('%s/%d %s', line, vim.fn.line('$'), col)
            end,
          },
          -- {
          --   require("opencode").statusline,
          -- },
        }
      },
    })
  end
}
