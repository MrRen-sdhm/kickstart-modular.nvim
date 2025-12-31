-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
  --

  -- modular approach: using `require 'path.name'` will
  -- include a plugin definition from file lua/path/name.lua

  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    lazy = false,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      require("kanagawa").setup({
        commentStyle = { italic = false },
      })
      -- vim.cmd.colorscheme("kanagawa-wave")
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    "polirritmico/monokai-nightasty.nvim",
    priority = 1000,
  },
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    -- config = function()
    --   require("monokai-pro").setup()
    -- end
  },
  {
    'morhetz/gruvbox',
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("gruvbox")
    -- end
  },
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    config = function()
      require('vscode').setup({
        -- Override colors (see ./lua/vscode/colors.lua)
        color_overrides = {
            -- vscBack = '#121212',
        },
      })
      -- vim.cmd.colorscheme("vscode")
    end
  },
  {
    "lunarvim/darkplus.nvim",
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("darkplus")
    -- end
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "tiagovla/tokyodark.nvim" },

  require 'plugins.flash',
  -- require 'plugins.persistence',
  require 'plugins.possession',
  require 'plugins.snacks',
  require 'plugins.bufferline',
  require 'plugins.aerial',
  require 'plugins.lualine',
  require 'plugins.leaderf',
  require 'plugins.nvim-colorizer',
  require 'plugins.vim-mark',
  require 'plugins.trouble',
  -- require 'plugins.copilot',
  -- require 'plugins.vim-illuminate',

  require 'kickstart.plugins.gitsigns',

  require 'kickstart.plugins.which-key',

  require 'kickstart.plugins.telescope',

  require 'kickstart.plugins.lspconfig',

  -- require 'kickstart.plugins.conform',

  require 'kickstart.plugins.blink-cmp',

  require 'kickstart.plugins.tokyonight',

  require 'kickstart.plugins.catppuccin',

  require 'kickstart.plugins.todo-comments',

  -- require 'kickstart.plugins.mini',

  require 'kickstart.plugins.treesitter',

  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line', -- it has been replaced by snacks.indent
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
