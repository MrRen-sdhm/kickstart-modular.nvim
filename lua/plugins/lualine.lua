return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup({
        options = {
          -- theme = "auto",
          theme = 'tokyonight-moon',
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
            { "diff" },
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
            }
          },
          lualine_c = {
            {
              "filename",
              path = 3, -- shows the full path and shorten $HOME to ~
            }
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
        }
      })
    end
}
